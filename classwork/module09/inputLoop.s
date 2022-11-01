# program to continuously ask user for input, and breaks when given -1
.global main
.global getInt


.text
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # get integer input from user in r0
  BL getInt
  MOV r5, r0

  startLoop:
    
    # check if input was -1
    CMP r5, #-1
    BEQ endLoop

      # print input
      LDR r0, =inputStr
      MOV r1, r5
      BL printf

      # get next integer input
      BL getInt
      MOV r5, r0
      B startLoop

  endLoop:

    # print final input string
    LDR r0, =inputStrEnd
    MOV r1, r5
    BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  inputStr: .asciz "Thank you for entering %d! I get to live another iteration!\n"
  inputStrEnd: .asciz "Such a shame you entered %d... I'll miss you :(\n"
# end main


.text
# function to get integer input from user and return in r0
getInt:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # get integer input from user
  LDR r0, =promptInt
  BL printf
  LDR r0, =formatInt
  LDR r1, =inputInt
  BL scanf

  # move input integer into r0
  LDR r0, =inputInt
  LDR r0, [r0, #0]

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  promptInt: .asciz "\nPlease enter an integer (enter -1 to quit): "
  formatInt: .asciz "%d"
  inputInt: .word 0
# end main
