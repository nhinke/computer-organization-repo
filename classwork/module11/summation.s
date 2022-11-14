.global main

.text
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # prompt the user for an integer (n) to sum up to
  LDR r0, =prompt
  BL printf
  LDR r0, =format
  LDR r1, =number
  BL scanf

  # compute sum(n) using our recursive function
  LDR r0, =number
  LDR r0, [r0, #0]
  BL sum

  # print the result
  MOV r2, r0
  LDR r1, =number
  LDR r1, [r1, #0]
  LDR r0, =output
  BL printf  

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output: .asciz "sum(%d) = %d\n"
  prompt: .asciz "Enter a integer to sum up to (i.e. sum(3) = 3+2+1+0 = 6): "
  format: .asciz "%d"
  number: .word 0
# end main

.text
# function to comute sum(n) that takes input n in r0 and returns result in r0
sum:

  # push stack (and preserve variable n in r4)
  SUB sp, sp, #8
  STR lr, [sp, #0]
  STR r4, [sp, #4]

  # store variable n in r4 for safe-keeping
  MOV r4, r0

  # base case: if (n == 0) return 0
  CMP r4, #0
  BNE else
    MOV r0, #0
    B return

  # else return (n + sum(n-1))
  else:
    SUB r0, r4, #1
    BL sum
    ADD r0, r4, r0
    B return

  endif:

  # pop stack and return
  return:
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    ADD sp, sp, #8
    MOV pc, lr

.data
# end sum
