.text
.global main
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # print prompt
  LDR r0, =prompt1
  BL printf

  # read input
  LDR r0, =format1
  LDR r1, =totalMinutes @ stores address of totalMinutes in r1
  BL scanf

  # divide input totalMinutes by 60
  LDR r0, =totalMinutes @ stores address of totalMinutes in r0
  LDR r0, [r0, #0]      @ stores value at address from r0 in r0 (which is totalMinutes value)
  MOV r1, #60
  BL __aeabi_idiv       @ divides r0 by r1 (totalMinutes/60)
  MOV r4, r0            @ moves resulting value (number of hours) from r0 into r4

  # multiply number of hours by 60
  MOV r1, #60           
#  MOV r0, r4
  MUL r0, r1, r4        @ number_of_hours*60 now stored in r0
  
  # get remaining minutes by substracting number_of_hours*60 from totalMinutes
  LDR r1, =totalMinutes
  LDR r1, [r1, #0]
  SUB r1, r1, r0        @ remaining minutes now stored in r1

  # r4 contains hours, r1 contains minutes
  # print results!
  MOV r2, r1            @ puts minutes in r2
  MOV r1, r4            @ puts hours in r4
  LDR r0, =output1
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output1: .asciz "Hours: %d Minutes: %d\n"
  prompt1: .asciz "Enter total minutes: "
  format1: .asciz "%d"
  totalMinutes: .word 0  @ 32 bits initialized to 0
#end main
