.text
.global main
main:

  # push the stack
  SUB sp, sp, #4
  STR lr, [sp, #0]  

  # print a prompt
  LDR r0, =prompt1
  BL printf

  # read in name
  LDR r0, =format1
  LDR r1, =name1
  BL scanf

  # print output string
  LDR r0, =output1
  LDR r1, =name1
  BL printf

  # pop the stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt1: .asciz "Please enter your name: "
  output1: .asciz "Hello %s!\n"
  format1: .asciz "%s"
  name1:   .space 40
# end main
