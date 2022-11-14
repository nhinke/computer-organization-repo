# Nick Hinke
# 11/13/2022
# 605.204 Computer Organization
# Module 11 Assignment - Problem 2
#
# Program to compute n'th Fibonacci number recursively
#

.global main

.text
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # prompt user for which Fibonacci number they would like to compute (n)
  LDR r0, =fibPrompt
  BL printf
  LDR r0, =intFormat
  LDR r1, =fibN
  BL scanf

  # move input n into r0 and call rescurive Fibonacci function
  LDR r0, =fibN
  LDR r0, [r0, #0]
  BL fibonacci

  # print result
  MOV r2, r0
  LDR r1, =fibN
  LDR r1, [r1, #0]
  LDR r0, =output
  BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  output:    .asciz "The n'th Fibonacci number for n = %d is: %d\n"
  fibPrompt: .asciz "Please enter a positive integer value for n to compute the n'th Fibonacci number: "
  intFormat: .asciz "%d"
  fibN: .word 0
# end main


.text
# recursive function to compute the n'th Fibonacci number given an input n in r0 and returns result in r0
fibonacci:

  # push stack
  SUB sp, sp, #12
  STR lr, [sp, #0]
  STR r4, [sp, #4]
  STR r5, [sp, #8]

  # preserve input value of n in r4
  MOV r4, r0

  # base case 0: if (n == 0) return 0
  CMP r4, #0
  MOVEQ r0, #1
  BEQ return

  # base case 1: if (n == 1) return 1
  CMP r4, #1
  BNE else
    MOV r0, #1
    B return

  # else return (fibonacci(n-1) + fibonacci(n-2))
  else:
    SUB r0, r4, #1
    BL fibonacci
    MOV r5, r0
    SUB r0, r4, #2
    BL fibonacci
    ADD r0, r0, r5
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
# end fibonacci
