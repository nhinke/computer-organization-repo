# Nick Hinke
# 10/23/2022
# 605.204 Computer Organization
# Module 8 Assignment
#
# Library of conversion functions used in each problem
#

.global miles2kilometers
.global kph
.global CToF
.global InchesToFeet


.text
# function to convert miles (in r0) to kilometers (returned in r0)
miles2kilometers:

  # Note that: numKM = numMI*1.60934
  # However, since we are strictly dealing with integers, we cannot multiply by 1.60934 directly.
  # We could multiply by 16 and subsequently divide by 10 (equivalent to multiplying by 1.6).
  # However, we could retain more accuracy by multiplying by 161 and dividing by 100 (equivalent to 1.61).
  # That being said, we could do better still by multiplying by 1609 and dividing by 1000 (equivalent to 1.609).

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # convert mi to km via: r0 = r0*161/100
  MOV r1, #161   
  MUL r0, r0, r1     @ r0 = miles*161
  MOV r1, #100
  BL __aeabi_idiv    @ r0 = miles*161/100

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
# end miles2kilometers


.text
# function to convert hours (in r0) and miles (in r1) to kph (returned in r0)
kph:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # convert hours and miles to kph via: r0 = miles2kilometers(r1)/r0
  LDR r2, =numHours
  STR r0, [r2, #0]     @ store hours in numHours
  MOV r0, r1           @ move miles to r0
  BL miles2kilometers  @ now kilometers in r0
  LDR r1, =numHours    
  LDR r1, [r1, #0]     @ move hours to r1
  BL __aeabi_idiv      @ r0 = miles2kilometers(miles)/hours

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  numHours: .word 0
# end kph


.text
# function to convert degrees Celsius (in r0) to degrees Fahrenheit (returned in r0)
CToF:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # convert Celsius to Fahrenheit via: r0 = r0*9/5+32
  MOV r1, #9
  MUL r0, r0, r1      @ r0 = Celsius*9
  MOV r1, #5
  BL __aeabi_idiv     @ r0 = Celsius*9/5
  ADD r0, r0, #32     @ r0 = Celsius*9/5+32

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
#end CToF


.text
# function to convert inches (in r0) to feet and inches (returned in r0 and r1, respectively)
InchesToFeet:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # get number of feet via: r0 = r0/12
  LDR r2, =numInches
  STR r0, [r2, #0]    @ store inches in numInches
  MOV r1, #12
  BL __aeabi_idiv     @ r0 = inches/12 = feet

  # get number of inches remaining via: r1 = inches-(r0*12)
  MOV r1, #12
  MUL r3, r0, r1      @ r3 = feet*12
  LDR r2, =numInches
  LDR r2, [r2, #0]    @ r2 = inches
  SUB r1, r2, r3      @ r1 = inches-(feet*12) = inches remaining

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  numInches: .word 0
#end InchesToFeet

