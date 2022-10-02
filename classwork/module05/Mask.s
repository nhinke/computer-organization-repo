.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # 
  MVN r4, #0           @ makes all 32 bits in r4 1
  MOV r5, #0x0000000f  @ makes last 4 bits in r5 1
  MOV r6, #1           @ makes last 1 bits in r6 1
  AND r1, r4, r5       @ stores result of r4 & r5 in r1 (masks all but last four bits of r4, turns off others)
  ORR r2, r1, r4       @ stores result of r1 | r4 in r2 (sets all 32 bits to 1 in r2)
  AND r1, r2, r6       @ stores result of r2 & r6 in r1 (masks all but last bit of r2, turns off others)

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data

# end main
