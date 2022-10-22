# Nick Hinke
# 10/23/2022
# 605.204 Computer Organization
# Module 8 Assignment - Problem 1
#
# Test library function (kph) written to convert miles and hours to km/hr 
#

.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print number of hours prompt
  LDR r0, =promptHr
  BL printf
  
  # read in number of hours
  LDR r0, =formatHr
  LDR r1, =numHr
  BL scanf

  # print number of miles prompt
  LDR r0, =promptMi
  BL printf

  # read in number of miles
  LDR r0, =formatMi
  LDR r1, =numMi
  BL scanf

  # load number of hours into r0 and number of miles into r1
  LDR r0, =numHr
  LDR r1, =numMi
  LDR r0, [r0, #0]
  LDR r1, [r1, #0]

  # call kph function in libConversions and print results
  BL kph
  MOV r1, r0
  LDR r2, =numHr
  LDR r3, =numMi
  LDR r2, [r2, #0]
  LDR r3, [r3, #0]
  LDR r0, =outputKph
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  outputKph: .asciz "You will need to travel at %d kph for %d hours to travel %d miles\n"
  promptHr: .asciz "Please enter the number of hours you will be traveling: "
  promptMi: .asciz "Please enter the number of miles you would like to go:  "
  formatHr: .asciz "%d"
  formatMi: .asciz "%d"
  numHr: .word 0
  numMi: .word 0
# end main
