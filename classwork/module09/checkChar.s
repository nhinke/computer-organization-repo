# program to check if data in r1 is a character
# can be implemented by checking the following:
#   if ((r1 >= 0x41 && r1 <= 0x5a) || (r1 >= 0x61 && r1 <= 0x7a)) --> char in r1
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
  MOV r8, r2
  LDR r0, =output
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
  MOV r8, r2
  LDR r0, =output
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
  MOV r8, r2
  LDR r0, =output
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
  MOV r8, r2
  LDR r0, =output
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
# function to check if value in r1 is a char (or not) --> returns result in r2
checkChar:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # check if r1 >= 0x41
  MOV r2, #0         @ set r2 to 0
  CMP r1, #0x41
  ADDGE r2, #1       @ set r2 to 1 if r1 >= 0x41

  # check if (r1 >= 0x41 && r1 <= 0x5a) --> i.e. if r1 is uppercase
  MOV r3, #0         @ set r3 to 0
  CMP r1, #0x5a
  ADDLT r3, #1       @ set r3 to 1 if r1 <= 0x5a
  AND r2, r2, r3     @ set r2 to 1 if (r2 == 1 && r3 == 1)

  # check if r1 >= 0x61
  MOV r0, #0         @ set r0 to 0
  CMP r1, #0x61   
  ADDGE r0, #1       @ set r0 to 1 if r1 >= 0x61

  # check if (r1 >= 0x61 && r1 <= 0x7a) --> i.e. if r1 is lowercase
  MOV r3, #0         @ set r3 to 0
  CMP r1, #0x7a
  ADDLT r3, #1       @ set r3 to 1 if r1 <= 0x7a
  AND r3, r3, r0     @ set r3 to 1 if (r0 == 1 && r3 == 1)
  
  # check if r1 is either uppercase or lowercase
  ORR r2, r2, r3

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
