.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print user ID prompt
  LDR r0, =prompt1
  BL printf

  # read input user ID
  LDR r0, =format1
  LDR r1, =usid
  BL scanf

  # print passkey prompt
  LDR r0, =prompt2
  BL printf

  # read input passkey
  LDR r0, =format2
  LDR r1, =pass
  BL scanf

  # load user ID and passkey into r0 and r1
  LDR r0, =usid
  LDR r1, =pass
  LDR r0, [r0, #0]
  LDR r1, [r1, #0]

  # XOR the user ID and password
  EOR r2, r0, r1
  EOR r3, r2, r0

  # print results
  MOV r1, r2
  MOV r2, r3
  LDR r0, =output1
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output1: .asciz "\nEOR = (User ID xor Passkey) = %d\n(EOR xor User ID) = %d\n"  
  prompt1: .asciz "Enter user ID: "
  prompt2: .asciz "Enter passkey: "
  format1: .asciz "%d"
  format2: .asciz "%d"
  usid: .word 0
  pass: .word 0
# end main
