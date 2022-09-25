.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # prompt for integer
  LDR r0, =prompt1
  BL printf

  # read input
  LDR r0, =format1
  LDR r1, =num1
  BL scanf

  # print input
  LDR r0, =output1
  LDR r1, =num1
  LDR r1, [r1, #0]
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt1: .asciz "Enter an integer: "
  output1: .asciz "Hah! You entered %d!\n"
  format1: .asciz "%d"
  num1:    .word  0
# end main
