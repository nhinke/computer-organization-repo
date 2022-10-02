# Nick Hinke
# 10/02/2022
# 605.204 Computer Organization
# Module 5 Assignment - Problem 5 (EC)
#
# Swap two variables using exclusive or
#
.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print first variable prompt (X)
  LDR r0, =promptX
  BL printf

  # read in first variable (X)
  LDR r0, =formatX
  LDR r1, =intX
  BL scanf

  # print second variable prompt (Y)
  LDR r0, =promptY
  BL printf

  # read in second variable (Y)
  LDR r0, =formatY
  LDR r1, =intY
  BL scanf

  # put variables in registers r3 and r4
  LDR r3, =intX
  LDR r4, =intY
  LDR r3, [r3, #0]
  LDR r4, [r4, #0]

  # swap registers r3 (X) and r4 (Y)
  EOR r3, r3, r4
  EOR r4, r3, r4
  EOR r3, r3, r4

  # print X results
  LDR r1, =intX
  LDR r1, [r1, #0]
  MOV r2, r3
  LDR r0, =outputX
  BL printf

  # print Y results
  LDR r1, =intY
  LDR r1, [r1, #0]
  MOV r2, r4
  LDR r0, =outputY
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  outputX: .asciz "\nOriginal X: %d\tNew X: %d"
  outputY: .asciz "\nOriginal Y: %d\tNew Y: %d\n"
  promptX: .asciz "Enter an integer for X: "
  promptY: .asciz "Enter an integer for Y: "
  formatX: .asciz "%d"
  formatY: .asciz "%d"
  intX: .word 0
  intY: .word 0
# end main
