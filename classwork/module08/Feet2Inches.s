# program to test Feet2Inches function in libConversions.s
.text
.global main
main:
  
  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # prompt for input in feet
  LDR r0, =prompt1
  BL printf

  # read input in feet
  LDR r0, =format1
  LDR r1, =num1
  BL scanf

  # load input into r0 and call function
  LDR r0, =num1     @ loads address of num1 into r0
  LDR r0, [r0, #0]  @ loads value of num1 into r0
  BL Ft2Inches

  # print number of inches
  MOV r1, r0
  LDR r0, =output1
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt1: .asciz "Enter number of feet: "
  output1: .asciz "Length in inches is:  %d\n"
  format1: .asciz "%d"
  num1: .word 0
