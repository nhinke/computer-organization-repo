.global a
.global b
.text
  LDR r1, =a  @ a is static external
  LDR r2, =b  @ b is external
  LDR r3, =c  @ c is external
  LDR r4, =d  @ d is static
.data
  a: .word 0
  d: .word 0
