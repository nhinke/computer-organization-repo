# Nick Hinke
# 10/02/2022
# 605.204 Computer Organization
# Module 5 Assignment - Problem 3
#
# Convert feet and inches to just inches
#
.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print feet prompt
  LDR r0, =promptFt
  BL printf

  # read in number of feet
  LDR r0, =formatFt
  LDR r1, =numFt
  BL scanf

  # print inches prompt
  LDR r0, =promptIn
  BL printf
  
  # read in number of inches
  LDR r0, =formatIn
  LDR r1, =numIn
  BL scanf

  # multiply number of feet by 12
  LDR r0, =numFt
  LDR r0, [r0, #0]
  MOV r1, #12
  MUL r3, r0, r1

  # add number of inches
  LDR r0, =numIn
  LDR r0, [r0, #0]  
  ADD r3, r0, r3

  # print result
  MOV r1, r3
  LDR r0, =output
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output:   .asciz "\nTotal number of inches: %d\n"
  promptFt: .asciz "Enter number of feet:   "
  promptIn: .asciz "Enter number of inches: "
  formatFt: .asciz "%d"
  formatIn: .asciz "%d"
  numFt: .word 0
  numIn: .word 0
# end main
