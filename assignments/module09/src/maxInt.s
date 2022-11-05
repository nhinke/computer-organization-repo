# Nick Hinke
# 10/23/2022
# 605.204 Computer Organization
# Module 9 Assignment - Problem 3
#
# Program to find the largest of three integer values 
#

.global main
.global promptForInteger
.global findMaxOf3

.text
main:

  # push the stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print welcome string
  LDR r0, =numIntsStr
  BL printf

  # prompt user for three integers and store in r5-r7
  BL promptForInteger
  MOV r5, r0
  BL promptForInteger
  MOV r6, r0
  BL promptForInteger
  MOV r7, r0

  # move integers into r0-r2 and branch to comparison function
  MOV r0, r5
  MOV r1, r6
  MOV r2, r7
  BL findMaxOf3
 
  # print result stotred in r0
  MOV r1, r0
  LDR r0, =endLoopStr
  BL printf 	
  
  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  numIntsStr: .asciz "Hello! Program ready to compare 3 integers...\n"
  endLoopStr: .asciz "\nMaximum integer found: %d\n"
# end main


.text
# function to find maximum of three integers (in r0-r2) and return result in r0

findMaxOf3:

  # push the stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # use r3 to contain maximum --> initially set to minimum possible int
  MOV r3, #1
  ROR r3, #1
  B CompareInt1
  
  # compare first integer to current maximum
  CompareInt1:
    CMP r0, r3
    BLE CompareInt2
      MOV r3, r0
      B CompareInt2
  
  # compare second integer to current maximum
  CompareInt2:
    CMP r1, r3
    BLE CompareInt3
      MOV r3, r1
      B CompareInt3

  # compare third integer to current maximum
  CompareInt3:
    CMP r2, r3
    BLE endComparisons
      MOV r3, r2
      B endComparisons

  # store result in r0
  endComparisons:
    MOV r0, r3

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
# end findMaxOf3


.text
# function to prompt user for an integer and return result in r0
promptForInteger:

  # push the stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # prompt user for an integer
  LDR r0, =intPrompt
  BL printf
  LDR r0, =intFormat
  LDR r1, =intValue
  BL scanf

  # store result in r0
  LDR r0, =intValue
  LDR r0, [r0, #0]

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  intPrompt: .asciz "Please enter an integer: "
  intFormat: .asciz "%d"
  intValue: .word 0
# end promptForInteger
