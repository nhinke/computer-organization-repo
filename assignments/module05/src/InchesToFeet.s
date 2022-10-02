# Nick Hinke
# 10/02/2022
# 605.204 Computer Organization
# Module 5 Assignment - Problem 3
#
# Convert inches to feet and inches
#
.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print total inches prompt
  LDR r0, =promptIn
  BL printf
  
  # read in number of inches
  LDR r0, =formatIn
  LDR r1, =numIn
  BL scanf

  # divide number of inches by 12 to get number of feet
  LDR r0, =numIn
  LDR r0, [r0, #0]
  MOV r1, #12
  BL __aeabi_idiv
  MOV r3, r0

  # multiply number of feet by 12
  MOV r0, r3
  MOV r1, #12
  MUL r4, r0, r1
   
  # subtract 12*feet from total inches to get remainar
  LDR r0, =numIn
  LDR r0, [r0, #0]
  SUB r5, r0, r4 

  # print result
  MOV r1, r3
  MOV r2, r5
  LDR r0, =output
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output:   .asciz "Feet: %d Inches: %d\n"
  promptIn: .asciz "Enter total number of inches: "
  formatIn: .asciz "%d"
  numIn: .word 0
# end main
