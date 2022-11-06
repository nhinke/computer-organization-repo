.global main

.text
main:

  # register dictionary:
  #   r4 - loop counter
  #   r5 - loop limit (size of array)
  #   r6 - base address of array
  #   r7 - current maximum value
  #   r8 - value at current array index

  # push stack
  SUB sp, sp, #24
  STR lr, [sp, #0]
  STR r4, [sp, #4]
  STR r5, [sp, #8]
  STR r6, [sp, #12]
  STR r7, [sp, #16]
  STR r8, [sp, #20]

  # set initial max value to minimum possible integer
  MOV r7, #1
  ROR r7, #1

  # initialize other registers appropriately
  MOV r4, #0
  LDR r5, =arraySize
  LDR r5, [r5, #0]
  LDR r6, =array

  startMaxLoop:

    # check loop end condition
    CMP r4, r5
    BGE endMaxLoop

    # get value of current array index 
    LSL r3, r4, #2          @ loopCounter*4 = number of bytes current array index is offset from base array memory address in memory
    ADD r8, r6, r3          @ r8 now contains address of current array index
    # could do both of the above steps in one line with:  ADD r8, r6, r4, LSL #2
    LDR r8, [r8, #0]

    # compare value to current maximum and update maximum if applicable
    CMP r8, r7
    MOVGT r7, r8

    # increment loop counter and return to top of loop
    ADD r4, r4, #1
    B startMaxLoop

  endMaxLoop:

    # print results
    MOV r1, r7
    LDR r0, =output
    BL printf

  # pop stack and return
  LDR lr, [sp, #0]
  LDR r4, [sp, #4]
  LDR r5, [sp, #8]
  LDR r6, [sp, #12]
  LDR r7, [sp, #16]
  LDR r8, [sp, #20]
  ADD sp, sp, #24
  MOV pc, lr

.data
  output: .asciz "The maximum value in the array was found: %d\n"
  array: .word 5
         .word 12
         .word 27
         .word 8
  arraySize: .word 4
# end main
