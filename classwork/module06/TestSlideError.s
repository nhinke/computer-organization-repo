.text
.global main
main:

  SUB sp, sp, #4
  STR lr, [sp, #0]

  MOV r3, #32, 8
  MOV r4, #38, 24
  MVN r5, #127, 8

  LDR r0, =output3
  MOV r1, r3
  BL printf

  LDR r0, =output4
  MOV r1, r4
  BL printf

  LDR r0, =output5
  MOV r1, r5
  BL printf

  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output3: .asciz "Value in R3: %d\n"
  output4: .asciz "Value in R4: %d\n"
  output5: .asciz "Value in R5: %d\n"
