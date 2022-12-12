# Nick Hinke
# 12/11/2022
# 605.204 Computer Organization
# Final - Problem 18
#
# Program to prompt user for integers until they enter -1, and then print entry statistics 
#

.global main
.global getIntegerInput
.global getAverageOfInputs


.text
main:

  # register dictionary:
  #   r4 - current integer input
  #   r5 - number of valid integer inputs
  #   r6 - running total of valid integer inputs
  #   r7 - average of all valid integer inputs 

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print welcome string
  LDR r0, =welcomeStr
  BL printf

  # initialize all meaningful register values to zero
  MOV r4, #0 
  MOV r5, #0
  MOV r6, #0
  MOV r7, #0

  # get integer input from user in r0
  BL getIntegerInput
  MOV r4, r0

  startLoop:
    
    # check if input was -1
    CMP r4, #-1
    BEQ endLoop

      # increment number of inputs (r6), and add current input to total 
      ADD r5, r5, #1
      ADD r6, r6, r4

      # get next integer input
      BL getIntegerInput
      MOV r4, r0
      B startLoop

  endLoop:

    # compute average of valid integer inputs
    MOV r0, r5
    MOV r1, r6
    BL getAverageOfInputs
    MOV r7, r0

    # print statistics
    LDR r0, =outputStr
    MOV r1, r5
    MOV r2, r6
    MOV r3, r7 
    BL printf

    # print final exit string 
    LDR r0, =exitStr
    BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  welcomeStr: .asciz "\nWelcome! You will be prompted to enter an arbitrary number of integers, and I will provide relevant statistics. Let's begin!\n\n"
  outputStr: .asciz "\nYou entered %d integers, which totaled to %d, giving an integer average of %d...\n"
  exitStr: .asciz "Exiting now, have a nice day!\n\n"
# end main


.text
# function to get integer input from user using scanf and return in r0
getIntegerInput:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # get integer input from user
  LDR r0, =promptInt
  BL printf
  LDR r0, =formatInt
  LDR r1, =inputInt
  BL scanf

  # move input integer into r0
  LDR r0, =inputInt
  LDR r0, [r0, #0]

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  promptInt: .asciz "Please enter an integer, or enter -1 to stop (-1 not counted): "
  formatInt: .asciz "%d"
  inputInt: .word 0
# end getIntegerInput


.text
# function to get average of integer inputs using number of inputs (r0) and total sum of inputs (r1) and returning result in r0
getAverageOfInputs:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # compute average
  MOV r2, r0
  MOV r0, r1      @ contains total sum of inputs
  MOV r1, r2      @ contains number of inputs
  BL __aeabi_idiv

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
# end getAverageOfInputs 
