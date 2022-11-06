.global main

.text
main:

  # register dictionary:
  #   r4 - loop counter
  #   r5 - loop limit

  # push stack
  SUB sp, sp, #12
  STR lr, [sp, #0]
  STR r4, [sp, #4]
  STR r5, [sp, #8]

  # initialize loop
  MOV r4, #0       @ loop counter
  MOV r5, #5       @ loop limit

  # print number of loop iterations
  LDR r0, =numIts
  MOV r1, r5
  BL printf

  StartLoop:

    # check limit
    CMP r4, r5
    BGE EndLoop    @ branch to end of loop if r4 >= r5

    # loop statement/block
    MOV r1, r4
    LDR r0, =loopId
    BL printf

    # increment loop counter and branch back to start
    ADD r4, r4, #1
    B StartLoop

  EndLoop:

    # print that the program has completed
    LDR r0, =endStr
    BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  LDR r4, [sp, #4]
  LDR r5, [sp, #8]
  ADD sp, sp, #12
  MOV pc, lr

.data
  endStr: .asciz "The loop has completed!\n"
  loopId: .asciz "Current loop counter value: %d\n"
  numIts: .asciz "The loop will execute for %d iterations...\n"
# end main
