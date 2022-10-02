# Nick Hinke
# 10/02/2022
# 605.204 Computer Organization
# Module 5 Assignment - Problem 4
#
# Multiply input integer by 10 using left bit shift
#
.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print prompt
  LDR r0, =prompt
  BL printf

  # read in input integer
  LDR r0, =format
  LDR r1, =inputInt
  BL scanf

  # store integer in r3
  LDR r3, =inputInt
  LDR r3, [r3, #0]

  # store 8*integer in r4
  LSL r4, r3, #3

  # store 2*integer in r5
  LSL r5, r3, #1

  # add results to get 10*integer in r6
  ADD r6, r4, r5

  # print results
  MOV r1, r3
  MOV r2, r6
  LDR r0, =output
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output: .asciz "%d * 10 = %d\n"
  prompt: .asciz "Enter an integer: "
  format: .asciz "%d"
  inputInt: .word 0
# end main
