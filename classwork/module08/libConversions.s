# always put global symbols at top
.global Ft2Inches
.global F2C

.text

# function to convert number of feet in r0 to inches (returned in r0)
Ft2Inches:

  # here, technically do not need to push and pop stack, but it is good practice to always do so
  # it is technically unecessary since no external functions are called

  # r0 = r0*12
  MOV r1, #12   
  MUL r0, r0, r1    @ r0 = r0*12

  # return
  MOV pc, lr

.data

# end Ft2Inches



.text

# function to convert fahrenheit in r0 to celsius (returned in r0)
F2C:

  # push stack --> must be done, since lr will be overwritten by BL call; thus, it must be saved first
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # r0 = (r0-32)*5/9
  SUB r0, r0, #32    @ r0 = (r0-32)
  MOV r1, #5
  MUL r0, r0, r1    @ r0 = (r0-32)*5
  MOV r1, #9
  BL __aeabi_idiv   @ r0 = (r0-32)*5/9

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data

# end F2C

