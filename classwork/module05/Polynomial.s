# X = 7 + 9/5*Y 
# should multiply 9*Y before dividing by 5 to retain more precisino
.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print prompt
  LDR r0, =prompt1
  BL printf

  # read input
  LDR r0, =format1
  LDR r1, =Y
  BL scanf

  # multiply Y*9
  LDR r0, =Y         @ loads address of Y into r0
  LDR r0, [r0, #0]   @ loads value of Y into r0
  MOV r1, #9         @ loads value 9 into r1
  MUL r0, r0, r1     @ r0 = Y*9
 
  # divide (Y*9)/5
  MOV r1, #5
  BL __aeabi_idiv    @ r0 = Y*9/5

  # add (Y*9/5)+7
  MOV r1, #7
  ADD r0, r0, r1     @ r0 = Y*9/5+7

  # print resulting value
  MOV r1, r0
  LDR r0, =output1
  BL printf

  # pop stack and retrun
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output1: .asciz "The value of X is: %d\n"
  prompt1: .asciz "Enter the value of Y: "
  format1: .asciz "%d"
  Y:       .word   0
# end main
