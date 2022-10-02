# Nick Hinke
# 10/02/2022
# 605.204 Computer Organization
# Module 5 Assignment - Problem 1
#
# Convert Celsius to Fahrenheit 
#
.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print prompt
  LDR r0, =prompt1
  BL printf

  # read input in degrees Celsius
  LDR r0, =format1
  LDR r1, =degCels
  BL scanf

  # multiply degrees Celsius by 9
  LDR r0, =degCels
  LDR r0, [r0, #0]
  MOV r1, #9
  MUL r0, r0, r1

  # divide by 5
  MOV r1, #5
  BL __aeabi_idiv

  # add 32
  MOV r1, #32
  ADD r0, r0, r1

  # print resulting degrees Fahrenheit
  MOV r2, r0
  LDR r1, =degCels
  LDR r1, [r1, #0]
  LDR r0, =output1
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt1: .asciz "Enter degrees Celsius: "
  output1: .asciz "Celsius: %d --> Fahrenheit: %d\n"
  format1: .asciz "%d"
  degCels: .word  0
# end main
