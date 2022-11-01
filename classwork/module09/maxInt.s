# program to compare 2-5 integers to find the maximum
.global main
.global numIntsValid

.text
main:

  # push the stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # use r9 to contain maximum --> initially set to minimum possible int
  MOV r9, #1
  ROR r9, #1

  # get number of integers to compare from user
  LDR r0, =promptNumInts
  BL printf
  LDR r0, =formatInt
  LDR r1, =numInts
  BL scanf

  # let r10 represent numIntsRemaining
  LDR r10, =numInts
  LDR r10, [r10, #0]

  # check if numInts is on range [2,5] and store result in r0
  MOV r0, r10
  BL checkNumIntsValid

  # if numInts valid, initialize loop
  CMP r0, #1
  BNE endMain
    # TODO get all integers and store in registers r4-r8 --> do NOT branch to endMain
    B endMain

#  start
  
  endMain:
  
  # pop the stack
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  promptNumInts: .asciz "Please enter the number of integers to be compared (2-5): "
  formatInt: .asciz "%d"
  endLoopStr: .asciz "Maximum integer found: %d"
  numInts: .word 0
# end main


.text
# function to check number of ints to be compared in r0 is on valid range [2,5] inclusive and store result in r0
checkNumIntsValid:

  # push the stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # store number of ints in r4 for safe keeping
  MOV r4, r0

  # check if r4 < 6 and store in r0
  MOV r0, #0
  CMP r4, #6
  ADDLT r0, r0, #1

  # check if r4 > 1 and store in r1
  MOV r1, #0
  CMP r4, #1
  ADDGT r1, r1, #1

  # check if numInts > 1 && numInts < 6, and print results
  AND r0, r0, r1
  CMP r0, #1
  BNE errNumInts
    LDR r0, =validStr
    MOV r1, r4
    BL printf
    MOV r0, #1
    B endCheckNumIntsValid

  errNumInts:
    LDR r0, =invalidStr
    MOV r1, r4
    BL printf
    MOV r0, #0

  endCheckNumIntsValid:
  
  # pop the stack
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  validStr: .asciz "Program is ready to compare %d integers to find the maximum\n"
  invalidStr: .asciz "ERROR: %d integers is not on the valid range of 2-5 integers for comparison\n"
# end checkNumIntsValid
