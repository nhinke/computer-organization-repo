# program to test F2C function in libConversions.s
.text
.global main
main:
  
  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # prompt for input in fahrenheit
  LDR r0, =prompt1
  BL printf

  # read input in fahrenheit
  LDR r0, =format1
  LDR r1, =deg1
  BL scanf

  # load input into r0 and call function
  LDR r0, =deg1     @ loads address of deg1 into r0
  LDR r0, [r0, #0]  @ loads value of deg1 into r0
  BL F2C

  # print degrees in celsius
  MOV r1, r0
  LDR r0, =output1
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt1: .asciz "Enter degrees Fahrenheit: "
  output1: .asciz "Equivalent deg. Celsius:  %d\n"
  format1: .asciz "%d"
  deg1: .word 0
