# Nick Hinke
# 10/30/2022
# 605.204 Computer Organization
# Module 9 Assignment - Problem 1b
#
# Program to check if data in r1 is a character without using logical variables
#
# Program can be implemented by checking the following:
#   if ((r1 >= 0x41 && r1 <= 0x5a) || (r1 >= 0x61 && r1 <= 0x7a)) --> char in r1
#

.global main
.global checkChar
.global printChar

.text
main:
  
  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # check if 0x42 is a char
  MOV r1, #0x42
  MOV r7, r1
  BL checkChar
  MOV r8, r0
  LDR r0, =output
  MOV r1, r7
  MOV r2, r8
  BL printf

  # print it if so
  CMP r8, #0
  BEQ endif1
    MOV r1, r7
    BL printChar
  endif1:

  # check if 0x5e is a char
  MOV r1, #0x5e
  MOV r7, r1
  BL checkChar
  MOV r8, r0
  LDR r0, =output
  MOV r1, r7
  MOV r2, r8
  BL printf

  # print it if so
  CMP r8, #0
  BEQ endif2
    MOV r1, r7
    BL printChar
  endif2:

  # check if 0x71 is a char 
  MOV r1, #0x71
  MOV r7, r1
  BL checkChar
  MOV r8, r0
  LDR r0, =output
  MOV r1, r7
  MOV r2, r8
  BL printf

  # print it if so
  CMP r8, #0
  BEQ endif3
    MOV r1, r7
    BL printChar
  endif3:

  # check if 0x82 is a char
  MOV r1, #0x82
  MOV r7, r1
  BL checkChar
  MOV r8, r0
  LDR r0, =output
  MOV r1, r7
  MOV r2, r8
  BL printf

  # print it if so
  CMP r8, #0
  BEQ endif4
    MOV r1, r7
    BL printChar
  endif4:

  # print newline 
  LDR r0, =line
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output: .asciz "\nValue: %d isChar: %d"
  line: .asciz "\n"
# end main


.text
# function to check if value in r1 is a char (or not) --> returns result in r0
checkChar:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # store value 1 in r0 for bit masking
  MOV r0, #1

  # check if r1 >= 0x41 by subtracting and checking sign using highest order bit
  SUB r2, r1, #0x41    @ r2 = r1 - 0x41
  ROR r2, #31          @ rotate highest order bit (HOB) to lowest order bit (LOB)
  MVN r2, r2           @ not r2 (now LOB 1 if subtraction positive, 0 if subtraction negative)
  AND r2, r2, r0       @ mask all but LOB
  
  # check if (r1 >= 0x41 && r1 <= 0x5a) --> i.e. if r1 is uppercase
  SUB r3, r1, #0x5a    @ r3 = r1 - 0x5a
  ROR r3, #31          @ rotate HOB to LOB (LOB 1 if subtraction negative, 0 if positive)
  AND r3, r3, r0       @ mask all but LOB
  AND r2, r2, r3       @ set r2 to 1 if (r2 == 1 && r3 == 1)

  # check if r1 >= 0x61
  SUB r4, r1, #0x61    @ r4 = r1 - 0x61
  ROR r4, #31          @ rotate HOB LOB
  MVN r4, r4           @ not r4 (now LOB 1 if subtraction positive, 0 if negative)
  AND r4, r4, r0       @ mask all but LOB
  
  # check if (r1 >= 0x61 && r1 <= 0x7a) --> i.e. if r1 is lowercase
  SUB r3, r1, #0x7a    @ r3 = r1 - 0x7a
  ROR r3, #31          @ rotate HOB to LOB (LOB 1 if subtraction negative, 0 if positive)
  AND r3, r3, r0       @ mask all but LOB
  AND r3, r4, r3       @ set r3 to 1 if (r4 == 1 && r3 == 1)

  # check if r1 is either uppercase or lowercase
  ORR r0, r2, r3

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
# end checkChar


.text
# function to print a character in r1
printChar:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print character
  LDR r0, =charStr
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  charStr: .asciz " Char: %c"
# end printChar
