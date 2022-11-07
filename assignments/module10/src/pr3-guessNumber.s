# Nick Hinke
# 11/05/2022
# 605.204 Computer Organization
# Module 10 Assignment - Problem 3
#
# Program that generates random number and plays game with user trying to guess it 
#

.global main
.global getRandomNum

.text
main:
 
  # register dictionary:
  #   r6  - minimum number in game
  #   r7  - maximum number in game
  #   r8  - random number to be guessed
  #   r9  - current guess from user
  #   r10 - number of guesses made
  #   r11 - boolean for use with RNG

  # push stack
  SUB sp, sp, #28
  STR lr, [sp, #0]
  STR r6, [sp, #4]
  STR r7, [sp, #8]
  STR r8, [sp, #12]
  STR r9, [sp, #16]
  STR r10, [sp, #20]
  STR r11, [sp, #24]

  # print welcome string
  LDR r0, =welcome
  BL printf

  # set RNG seed boolean
  MOV r11, #0

  startSentinelLoop:

    # prompt user for maximum number in game
    LDR r0, =numPrompt
    BL printf
    LDR r0, =numFormat
    LDR r1, =num
    BL scanf
    LDR r7, =num
    LDR r7, [r7, #0]

    # set minimum number for game
    MOV r6, #1

    # check if user would like to exit
    CMP r7, #-1
    BEQ endSentinelLoop

    # check if number on valid range [2,inf], and branch accordingly
    CMP r7, #1
    BLE errNumInput
      B playGame

    errNumInput:

      # print error message and return to start of sentinel loop
      LDR r0, =errInput
      MOV r1, r7
      BL printf
      B startSentinelLoop

    playGame:

      # set number of guess so far to 0
      MOV r10, #0

      # get random number and store in r8
      MOV r0, r7
      MOV r1, #3
      BL __aeabi_idiv
      MOV r4, #0          @ loop counter
      MOV r5, r0          @ loop limit
      CMP r11, #0
      ADDEQ r0, r6, #1    @ RNG seed
      SUBNE r0, r7, #1    @ RNG seed
      startRandomNumLoop:
        ADD r1, r6, r4    @ min
        SUB r2, r7, r4    @ max
        BL getRandomNum
        ADD r4, r4, #1
        CMP r4, r5
        BGE endRandomNumLoop
        B startRandomNumLoop
      endRandomNumLoop:
        MOV r1, r6        @ min
        MOV r2, r7        @ max
        BL getRandomNum
        MOV r8, r0
        B startGuessingLoop

      startGuessingLoop:

        # prompt user for guess and store in r9
        LDR r0, =guessPrompt
        BL printf
        LDR r0, =guessFormat
        LDR r1, =guess
        BL scanf
        LDR r9, =guess
        LDR r9, [r9, #0]

        # check if guess == -1 to give up
        CMP r9, #-1
        BEQ guessIsQuit
        ADD r10, r10, #1

        # check if guess higher/lower/correct
	CMP r9, r8
        BEQ guessIsCorrect
        BLT guessIsLow
        BGT guessIsHigh

        guessIsQuit:
          LDR r0, =guessIsQuitStr
          MOV r1, r10
          BL printf
          B endGame

        guessIsCorrect:
          LDR r0, =guessIsCorrectStr
          MOV r1, r10
          BL printf
          B endGame

        guessIsLow:
          LDR r0, =guessIsLowStr
          BL printf
          B startGuessingLoop
        
        guessIsHigh:
          LDR r0, =guessIsHighStr
          BL printf
          B startGuessingLoop

    endGame:

      # print game results and branch back to top of sentinel loop see if user wants to play again
      LDR r0, =endGameStr
      BL printf
      CMP r11, #1
      MOVEQ r11, #0
      MOVNE r11, #1
      B startSentinelLoop
 
  endSentinelLoop:

    # print that program is exiting
    LDR r0, =exitStr
    BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  LDR r6, [sp, #4]
  LDR r7, [sp, #8]
  LDR r8, [sp, #12]
  LDR r9, [sp, #16]
  LDR r10, [sp, #20]
  LDR r11, [sp, #24]
  ADD sp, sp, #28
  MOV pc, lr

.data
  welcome:     .asciz "\nWelcome! This is a game where the program will silently generate a pseudo-random number on the range from 1 to a user-defined maximum, and the user has to guess what it is. Have fun!\n\n"
  numPrompt:   .asciz "Please enter the maximum value for the pseudo-random number, or enter -1 to exit: "
  numFormat:   .asciz "%d"
  exitStr:     .asciz "Program exiting now!\n"
  errInput:    .asciz "ERROR: %d is not on valid range for maximum value (2+)\n"
  endGameStr:  .asciz "\nThanks for playing! You will now be prompted to play again...\n"
  guessPrompt: .asciz "\nPlease enter your guess: "
  guessFormat: .asciz "%d"
  guessIsQuitStr:    .asciz "User has given up after %d guesses!\n"
  guessIsCorrectStr: .asciz "Congratulations! User has won after %d guesses!\n"
  guessIsLowStr:     .asciz "Your guess was too low...\n"
  guessIsHighStr:    .asciz "Your guess was too high...\n"
  num:   .word 0
  guess: .word 0
# end main


.text
# function to get a random num between two values (min in r1 and max in r2) from a seed (in r0) and return result in r0
getRandomNum:

  # Note: function designed to work with all positive integers, and with min <= seed <= max
  #   function could easily be further generalized at a later time

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # store seed as well as minimum and maximum values
  LDR r3, =seed
  STR r0, [r3, #0]
  LDR r3, =min
  STR r1, [r3, #0]
  LDR r3, =max
  STR r2, [r3, #0]
  
  # compute width of valid range
  LDR r3, =range
  SUB r2, r2, r1
  STR r2, [r3, #0]

  # get minimum output from sequence of operations used to generate pseudorandom number
  LDR r1, =min
  LDR r1, [r1, #0]
  MOV r0, #254
  MUL r1, r1, r0
  SUB r1, r1, #77
  MOV r0, #127
  MUL r1, r1, r0
  SUB r1, r1, #16
  LDR r2, =minout
  STR r1, [r2, #0]

  # get maximum output from sequence of operations used to generate pseudorandom number
  LDR r1, =max
  LDR r1, [r1, #0]
  MOV r0, #254
  MUL r1, r1, r0
  SUB r1, r1, #77
  MOV r0, #127
  MUL r1, r1, r0
  SUB r1, r1, #16
  LDR r2, =maxout
  STR r1, [r2, #0]

  # compute width of output range
  LDR r1, =minout
  LDR r2, =maxout
  LDR r3, =rangeout
  LDR r1, [r1, #0]
  LDR r2, [r2, #0]
  SUB r2, r2, r1
  STR r2, [r3, #0]

  # perform sequence of operations on seed
  LDR r1, =seed
  LDR r1, [r1, #0]
  MOV r0, #254
  MUL r1, r1, r0
  SUB r1, r1, #77
  MOV r0, #127
  MUL r1, r1, r0
  SUB r1, r1, #16
  LDR r2, =seedout
  STR r1, [r2, #0]

  # map output to valid range
  LDR r0, =range
  LDR r1, =seedout
  LDR r2, =minout
  LDR r0, [r0, #0]         @ r1 = x
  LDR r1, [r1, #0]         @ r1 = x
  LDR r2, [r2, #0]
  SUB r1, r1, r2           @ r1 = x - inputMin
  MUL r1, r1, r0           @ r1 = (x - inputMin) * (outputMax - outputMin)
  MOV r0, r1               @ r0 = (x - inputMin) * (outputMax - outputMin)
  LDR r1, =rangeout        
  LDR r1, [r1, #0]         @ r1 = (inputMax - inputMin)
  BL __aeabi_idiv          @ r0 = (x - inputMin) * (outputMax - outputMin) / (inputMax - inputMin)
  LDR r1, =min
  LDR r1, [r1, #0]         @ r1 = outputMin
  ADD r0, r0, r1           @ r0 = (x - inputMin) * (outputMax - outputMin) / (inputMax - inputMin) + outputMin

  # trim output to valid range if necessary 
  LDR r1, =min
  LDR r2, =max
  LDR r1, [r1, #0]
  LDR r2, [r2, #0]
  CMP r0, r1
  MOVLT r0, r1
  CMP r0, r2
  MOVGT r0, r2

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  max:      .word 0
  min:      .word 0
  seed:     .word 0
  range:    .word 0
  minout:   .word 0
  maxout:   .word 0
  seedout:  .word 0
  rangeout: .word 0
# end getDivRemainder
