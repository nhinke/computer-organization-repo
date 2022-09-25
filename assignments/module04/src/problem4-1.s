# Nick Hinke
# 09/25/2022
# 605.204 Computer Organization
# Module 4 Assignment - Problem 1
#
# Ask user for age, and print it
#
.text
.global main
main:

  # push the stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print name prompt
  LDR r0, =namePrompt
  BL printf

  # read name input
  LDR r0, =nameFormat
  LDR r1, =nameStr
  BL scanf

  # print age prompt
  LDR r0, =agePrompt
  BL printf
  
  # read age input
  LDR r0, =ageFormat
  LDR r1, =ageInt
  BL scanf

  # print output
  LDR r0, =outputStr
  LDR r1, =nameStr
  LDR r2, =ageInt
  LDR r2, [r2, #0]
  BL printf

  # pop the stack
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  outputStr:  .asciz "Hello %s, you are %d years old!\n"
  namePrompt: .asciz "Please enter your name: "
  agePrompt:  .asciz "Please enter your age:  "
  nameFormat: .asciz "%s"
  ageFormat:  .asciz "%d"
  nameStr:    .space 40
  ageInt:     .word  0
# end main
