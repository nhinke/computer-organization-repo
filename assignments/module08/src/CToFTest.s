# Nick Hinke
# 10/23/2022
# 605.204 Computer Organization
# Module 8 Assignment - Problem 2a
#
# Test library function (CToF) written to convert Celsius to Fahrenheit 
#

.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print degrees Celsius prompt
  LDR r0, =promptCels
  BL printf
  
  # read in degrees Celsius
  LDR r0, =formatCels
  LDR r1, =degCels
  BL scanf

  # load degrees Celsius into r0
  LDR r0, =degCels
  LDR r0, [r0, #0]

  # call CToF function in libConversions and print results
  BL CToF
  MOV r2, r0
  LDR r1, =degCels
  LDR r1, [r1, #0]
  LDR r0, =outputFahr
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  outputFahr: .asciz "%d degrees Celsius is equivalent to: %d degrees Fahrenheit\n"
  promptCels: .asciz "Please enter temperature in degrees Celsius: "
  formatCels: .asciz "%d"
  degCels: .word 0
# end main
