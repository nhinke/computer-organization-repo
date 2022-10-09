.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # test if Operand2 gives 198
  MOV r3, #1, 0 
  MOV r2, r3
  MOV r1, #198
  LDR r0, =output3
  BL printf

  # test if Operand2 gives 260
  MOV r4, #1, 0 
  MOV r2, r4
  MOV r1, #260
  LDR r0, =output4
  BL printf

  # test if Operand2 gives 9216
  MOV r5, #1, 0 
  MOV r2, r5
  MOV r1, #9216
  LDR r0, =output5
  BL printf

  # test if Operand2 gives 2162688
  MOV r6, #1, 0
  MOV r2, r6
  MOV r1, #2162688
  LDR r0, =output6
  BL printf

  # test if Operand2 gives -75
  MOV r7, #1, 0 
  MOV r2, r7
  MOV r1, #-75
  LDR r0, =output7
  BL printf

  # test if Operand2 gives -265
  MOV r8, #1, 0
  MOV r2, r8
  MOV r1, #-265
  LDR r0, =output8
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output3: .asciz "R3 Goal: %d\tR3 Value: %d\n"
  output4: .asciz "R4 Goal: %d\tR4 Value: %d\n"
  output5: .asciz "R5 Goal: %d\tR5 Value: %d\n"
  output6: .asciz "R6 Goal: %d\tR6 Value: %d\n"
  output7: .asciz "R7 Goal: %d\tR7 Value: %d\n"
  output8: .asciz "R8 Goal: %d\tR8 Value: %d\n"
# end main
