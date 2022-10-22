# Nick Hinke
# 10/23/2022
# 605.204 Computer Organization
# Module 8 Assignment - Problem 2b
#
# Test library function (InchesToFeet) written to convert inches to feet and inches
#

.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print number of inches prompt
  LDR r0, =promptIn
  BL printf
  
  # read in number of inches
  LDR r0, =formatIn
  LDR r1, =numIn
  BL scanf

  # load number of inches into r0
  LDR r0, =numIn
  LDR r0, [r0, #0]

  # call InchesToFeet function in libConversions and print results
  BL InchesToFeet
  MOV r2, r0
  MOV r3, r1
  LDR r1, =numIn
  LDR r1, [r1, #0]
  LDR r0, =outputFtIn
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  outputFtIn: .asciz "%d inches is equivalent to: %d feet and %d inches\n"
  promptIn: .asciz "Please enter total number of inches: "
  formatIn: .asciz "%d"
  numIn: .word 0
# end main
