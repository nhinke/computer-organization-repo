# Nick Hinke
# 10/02/2022
# 605.204 Computer Organization
# Module 5 Assignment - Problem 2
#
# Read in integer, negate it, and print
#
.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print input prompt
  LDR r0, =prompt1
  BL printf

  # read input integer
  LDR r0, =format1
  LDR r1, =inputInt
  BL scanf

  # load integer into r4
  LDR r4, =inputInt
  LDR r4, [r4, #0]

  # perform two's complement on integer
  MVN r5, r4
  ADD r5, r5, #1

  # print results
  MOV r1, r4
  MOV r2, r5
  LDR r0, =output1
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output1: .asciz "\nOriginal Integer: %d\nNegated Version: %d\n"
  prompt1: .asciz "Enter an integer: "
  format1: .asciz "%d"
  inputInt: .word 0
# end main
