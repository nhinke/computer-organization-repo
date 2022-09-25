# Nick Hinke
# 09/25/2022
# 605.204 Computer Organization
# Module 4 Assignment - Problem 2
#
# Output a string with tabs in it
#
.text
.global main
main:

  # push the stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print output
  LDR r0, =outputStr
  BL printf

  # pop the stack
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  outputStr:  .asciz "Hi! \t Hello! \t Howdy!\n"
# end main

