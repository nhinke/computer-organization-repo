.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # divide r0 by r1 (integer division)
  MOV r0, #8
  MOV r1, #2
  BL __aeabi_idiv  @ value r0/r1 now stored in r0

  # print result
  MOV r1, r0
  LDR r0, =output1
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output1: .asciz "The result of 8/2 is: %d \n"
# end main
