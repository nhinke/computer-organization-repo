.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # multiply r4 by 4 (or 2^2 --> 2 shift) and store in r5
  MOV r4, #7
  LSL r5, r4, #2

  # multiply r4 by 9 (8+1 --> 3 shift and 0 shift) and store in r6
  LSL r6, r4, #3
  ADD r6, r6, r4

  # divide r4 by 2 (or 2^1 --> 1 shift) and store in r7
  ASR r7, r4, #1    @ results in 3 from truncation

  # divide -r4 by 2 and store in r8
  MVN r3, r4
  ADD r3, r3, #1    @ puts -r4 in r3
  ASR r8, r3, #1    @ results in -4 from truncation (floor)

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data

# end main
