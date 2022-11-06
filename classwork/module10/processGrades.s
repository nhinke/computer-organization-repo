.global main

.text
main:

  # register dictionary:
  #   r4 - counter for grade loop
  #   r5 - limit for grade loop
  #   r6 - total student score
  #   r7 - average student score
  #   r8 - student letter grade
  #   r9 - student name

  # push stack
  SUB sp, sp, #28
  STR lr, [sp, #0]
  STR r4, [sp, #4]
  STR r5, [sp, #8]
  STR r6, [sp, #12]
  STR r7, [sp, #16]
  STR r8, [sp, #20]
  STR r9, [sp, #24]

  # initialize loop by asking user if they would like to continue
  LDR r0, =exitPrompt
  BL printf
  LDR r0, =exitFormat
  LDR r1, =exitVal
  BL scanf

  startSentinelLoop:

    # check if user would like to exit
    LDR r1, =exitVal
    LDR r1, [r1, #0]
    CMP r1, #-1
    BEQ endSentinelLoop

    # get student name from user
    LDR r0, =namePrompt
    BL printf
    LDR r0, =nameFormat
    LDR r1, =name
    BL scanf
    LDR r9, =name

    # initialize grade loop
    MOV r4, #0
    LDR r5, =numGrades
    LDR r5, [r5, #0]
    MOV r6, #0

    # print out number of grades to be entered by user
    LDR r0, =numGradStr
    MOV r1, r5
    MOV r2, r9
    BL printf

    startGradeLoop:

      # check loop exit condition
      CMP r4, r5
      BGE endGradeLoop

      # prompt user for grade
      LDR r0, =gradPrompt
      MOV r1, r9
      BL printf
      LDR r0, =gradFormat
      LDR r1, =grade
      BL scanf

      # check if input grade is valid (on range [0-100]) and store result in r1
      LDR r0, =grade
      LDR r0, [r0, #0]
      MOV r1, #0
      CMP r0, #0
      ADDGE r1, r1, #1
      MOV r2, #0
      CMP r0, #100
      ADDLE r2, r2, #1
      AND r1, r1, r2
 
      CMP r1, #0
      BEQ gradeInputError
        LDR r0, =grade
        LDR r0, [r0, #0]
        ADD r6, r6, r0        @ add current grade input to running grade total
        B endGradeInput

      gradeInputError:
        LDR r0, =gradErrStr
        LDR r1, =grade
        LDR r1, [r1, #0]
        BL printf
        SUB r4, r4, #1        @ decrement loop counter

      endGradeInput:

      # increment loop counter and branch back to start of loop
      ADD r4, r4, #1
      B startGradeLoop

    endGradeLoop:

    # compute average grade for student
    MOV r0, r6
    LDR r1, =numGrades
    LDR r1, [r1, #0]
    BL __aeabi_idiv       @ r0 = total cumulative grade / num grades
    MOV r7, r0

    # get letter grade corresponding to average in r7
    CMP r7, #90
    BLT gradeB
      LDR r8, =A
      B endGetLetterGrade
    gradeB:
    CMP r7, #80
    BLT gradeC
      LDR r8, =B
      B endGetLetterGrade
    gradeC:
    CMP r7, #70
    BLT gradeF
      LDR r8, =C
      B endGetLetterGrade
    gradeF:
    LDR r8, =F

    endGetLetterGrade:

      # print result
      LDR r0, =outputStr
      MOV r1, r9
      MOV r2, r7
      MOV r3, r8
      BL printf

    # ask user if they would like to continue  
    LDR r0, =exitPrompt
    BL printf
    LDR r0, =exitFormat
    LDR r1, =exitVal
    BL scanf
    B startSentinelLoop

  endSentinelLoop:

  # pop stack and return
  LDR lr, [sp, #0]
  LDR r4, [sp, #4]
  LDR r5, [sp, #8]
  LDR r6, [sp, #12]
  LDR r7, [sp, #16]
  LDR r8, [sp, #20]
  LDR r9, [sp, #24]
  ADD sp, sp, #28
  MOV pc, lr

.data
  outputStr:  .asciz "%s has an average of %d which results in the following letter grade: %s\n"
  numGradStr: .asciz "Program ready to read in %d grades for %s...\n"
  gradErrStr: .asciz "ERROR: %d is not on valid range from 0-100!\n"
  exitPrompt: .asciz "Enter -1 to exit, or any other integer to continue: "
  namePrompt: .asciz "Please enter the student's name: "
  gradPrompt: .asciz "Please enter an integer score for %s: "
  nameFormat: .asciz "%s"
  gradFormat: .asciz "%d"
  exitFormat: .asciz "%d"
  name:      .space 50
  grade:     .word 0
  exitVal:   .word 0
  numGrades: .word 5
  A: .asciz "A"
  B: .asciz "B"
  C: .asciz "C"
  F: .asciz "F"
# end main
