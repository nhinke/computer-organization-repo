# Nick Hinke
# 10/02/2022
# 605.204 Computer Organization
# Module 5 Assignment - Problem 1
#
# Convert Fahrenheit to Celsius
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

  # read input in degrees Fahrenheit
  LDR r0, =format1
  LDR r1, =degFahr
  BL scanf

  # subtract 32 from degrees Fahrenehit
  LDR r0, =degFahr
  LDR r0, [r0, #0]
  SUB r0, r0, #32

  # multiply by 5
  MOV r1, #5
  MUL r0, r0, r1

  # divide by 9
  MOV r1, #9
  BL __aeabi_idiv

  # print resulting degrees Celsius
  MOV r2, r0
  LDR r1, =degFahr
  LDR r1, [r1, #0]
  LDR r0, =output1
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt1: .asciz "Enter degrees Fahrenheit: "
  output1: .asciz "Fahrenheit: %d --> Celsius: %d\n"
  format1: .asciz "%d"
  degFahr: .word  0
# end main
