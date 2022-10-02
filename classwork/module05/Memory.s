.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # puts num1 into r0
  LDR r4, =num1    @ puts address of num1 into r4
  LDR r0, [r4, #0] @ puts value at address from r4 into r0 (which is num1)

  # put 7 into num1
  MOV r0, #7       @ puts value 7 into r0
  STR r0, [r4, #0] @ puts value 7 at address in r4 (num1 address now contains 7 -- is value also 7?)

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  num1: .word 25     @ 32 bit integer initialized with value 25
# end main
