# Nick Hinke
# 11/05/2022
# 605.204 Computer Organization
# Module 10 Assignment - Problem 2
#
# Program to check whether or not a number is prime 
#

.global main
.global getDivRemainder

.text
main:

  # register dictionary:
  #   r4 - counter for prime loop
  #   r5 - limit for prime loop
  #   r6 - number to test if prime
  #   r7 - current divisor
  #   r8 - boolean isPrime

  # push stack
  SUB sp, sp, #24
  STR lr, [sp, #0]
  STR r4, [sp, #4]
  STR r5, [sp, #8]
  STR r6, [sp, #12]
  STR r7, [sp, #16]
  STR r8, [sp, #20]

  startSentinelLoop:

    # prompt user for number to test
    LDR r0, =numPrompt
    BL printf
    LDR r0, =numFormat
    LDR r1, =num
    BL scanf
    LDR r6, =num
    LDR r6, [r6, #0]

    # check if user would like to exit
    CMP r6, #-1
    BEQ endSentinelLoop

    # check if number on valid range [3,inf], and branch accordingly
    CMP r6, #2
    BLE errNumInput
      B checkPrime

    errNumInput:

      # print error message and return to start of sentinel loop
      LDR r0, =errInput
      MOV r1, r6
      BL printf
      B startSentinelLoop

    checkPrime:

      # get number of iterations loop must run through (n/2 - 2)
      MOV r0, r6
      MOV r1, #2
      BL __aeabi_idiv
      SUB r0, r0, #2

      # initialize loop
      MOV r5, r0        @ loop limit
      MOV r4, #0        @ loop counter
      MOV r7, #2        @ current divisor
      MOV r8, #1        @ boolean isPrime

      startPrimeLoop:

        # check if loop limit reached
        CMP r4, r5
        BGE endPrimeLoop

        # check if number divisible by current divisor
        MOV r0, r6
        MOV r1, r7
        BL getDivRemainder
        CMP r0, #0
        MOVEQ r8, #0
        BEQ endPrimeLoop

        # increment loop counter and current divisor and return to top of loop
        ADD r4, r4, #1
        ADD r7, r7, #1
        B startPrimeLoop

      endPrimeLoop:
       
        # print result and return to top of sentinel loop
        MOV r1, r6
        CMP r8, #1
        BEQ printPrime
          B printNotPrime

        printPrime:
          LDR r0, =primeResult
          BL printf
          B startSentinelLoop

        printNotPrime:
          LDR r0, =notPrimeResult
          BL printf
          B startSentinelLoop
         
  endSentinelLoop:

    # print that program is exiting
    LDR r0, =exitStr
    BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  LDR r4, [sp, #4]
  LDR r5, [sp, #8]
  LDR r6, [sp, #12]
  LDR r7, [sp, #16]
  LDR r8, [sp, #20]
  ADD sp, sp, #24
  MOV pc, lr

.data
  primeResult:    .asciz "Input %d is prime!\n"
  notPrimeResult: .asciz "Input %d is NOT prime!\n"
  exitStr:   .asciz "Program exiting now!\n" 
  errInput:  .asciz "ERROR: %d is not on valid range (3+)\n"
  numPrompt: .asciz "\nPlease enter an integer to test if it's prime, or enter -1 to exit: "
  numFormat: .asciz "%d"
  num: .word 0
# end main


.text
# function to get remainder from integer division (r0/r1) and return result in r0
getDivRemainder:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # store dividend and divisor
  LDR r2, =dividend
  LDR r3, =divisor
  STR r0, [r2, #0]
  STR r1, [r3, #0]

  # compute quotient
  BL __aeabi_idiv
  LDR r1, =quotient
  STR r0, [r1, #0]

  # compute remainder and store in r0
  LDR r0, =dividend
  LDR r1, =divisor
  LDR r2, =quotient
  LDR r0, [r0, #0]
  LDR r1, [r1, #0]
  LDR r2, [r2, #0]
  MUL r1, r1, r2
  SUB r0, r0, r1

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  dividend: .word 0
  divisor:  .word 0
  quotient: .word 0
# end getDivRemainder
