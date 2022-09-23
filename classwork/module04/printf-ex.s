.text
.global main
main:
  SUB sp, sp, #4
  STR lr, [sp, #0]

  LDR r0, =formatString
  LDR r1, =name
  MOV r2, #69
  BL printf

  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  formatString: .asciz "Hello %s, are you %d years old?\n"
  name: .asciz "BillyBob"
# end main
