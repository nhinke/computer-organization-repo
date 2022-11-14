# Nick Hinke
# 11/13/2022
# 605.204 Computer Organization
# Module 11 Assignment - Problem 1
#
# Program to implement multiplication using recursive addition
#

.global main

.text
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # prompt the user for an integer m to be used when computing the product m*n
  LDR r0, =intPrompt1
  BL printf
  LDR r0, =intFormat
  LDR r1, =int1
  BL scanf

  # prompt the user for an integer n to be used when computing the product m*n
  LDR r0, =intPrompt2
  BL printf
  LDR r0, =intFormat
  LDR r1, =int2
  BL scanf

  # load m and n into r0 and r1, respectively
  LDR r0, =int1
  LDR r1, =int2
  LDR r0, [r0, #0]
  LDR r1, [r1, #0]

  # compute product using recursive function mult(m,n) and print result
  BL mult
  MOV r3, r0
  LDR r1, =int1
  LDR r2, =int2
  LDR r1, [r1, #0]
  LDR r2, [r2, #0]
  LDR r0, =output
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output:     .asciz "The product of %d*%d = %d\n"
  intPrompt1: .asciz "Please enter a positive integer m to compute the product m*n: "
  intPrompt2: .asciz "Please enter a positive integer n to compute the product m*n: "
  intFormat:  .asciz "%d"
  int1: .word 0
  int2: .word 0
# end main


.text
# recursive function mult(m,n) to multiply value in r0 (m) by value in r1 (n) using successive additions, and return result in r0
mult:

  # push stack (and preserve inputs (m,n) in r4 and r5)
  SUB sp, sp, #12
  STR lr, [sp, #0]
  STR r4, [sp, #4]
  STR r5, [sp, #8]

  # store inputs (m,n) in r4 and r5
  MOV r4, r0
  MOV r5, r1

  # base case 0: if (n == 0) return 0
  CMP r5, #0
  MOVEQ r0, #0
  BEQ return

  # base case 1: if (n == 1) return m 
  CMP r5, #1
  BNE else
    MOV r0, r4
    B return

  # else return (m + mult(m,n-1))
  else:
    SUB r1, r5, #1
    BL mult
    ADD r0, r4, r0
    B return 

  endif:

  # pop stack and return
  return:
  LDR lr, [sp, #0]
  LDR r4, [sp, #4]
  LDR r5, [sp, #8]
  ADD sp, sp, #12
  MOV pc, lr

.data
# end mult
