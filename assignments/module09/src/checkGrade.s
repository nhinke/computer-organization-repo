# Nick Hinke
# 10/23/2022
# 605.204 Computer Organization
# Module 9 Assignment - Problem 2
#
# Program to print the corresponding letter grade given an input grade number 
#

.global main
.global checkGradeValid
.global printLetterGrade


.text
main:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # prompt and read stduent name from user
  LDR r0, =promptName
  BL printf
  LDR r0, =formatName
  LDR r1, =name
  BL scanf

  # prompt and read number grade for student from user
  LDR r0, =promptGrade
  LDR r1, =name
  BL printf
  LDR r0, =formatGrade
  LDR r1, =grade
  BL scanf

  # check number grade valid using checkGradeValid function (result returned in r0)
  LDR r0, =grade
  LDR r0, [r0, #0]
  BL checkGradeValid

  # if number grade valid, print letter grade using printLetterGrade function
  CMP r0, #1
  BNE endMain
    LDR r0, =name
    LDR r1, =grade
    LDR r1, [r1, #0]
    BL printLetterGrade

  endMain:

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  promptName:  .asciz "Please enter the student's name: "
  promptGrade: .asciz "Please enter an integer grade on [0,100] for %s: "
  formatName:  .asciz "%s"
  formatGrade: .asciz "%d"
  name: .space 32
  grade: .word 0
# end main


.text
# function to check if input quantitative grade is on valid range [0-100], and return result in r0
checkGradeValid:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # store number grade in r5 for safe keeping
  MOV r5, r0

  # check if grade between 0 and 100 inclusive
  MOV r0, #0            @ set r0 to 0
  CMP r5, #0
  ADDGE r0, r0, #1      @ set r0 to 1 if grade >= 0
  MOV r1, #0            @ set r1 t0 0
  CMP r5, #100
  ADDLE r1, r1, #1      @ set r1 to 1 if grade <= 100
  AND r2, r0, r1        @ set r2 to 1 if (grade >= 0 && grade <= 100)

  CMP r2, #1
  BNE errorMsg
    MOV r1, #1
    B endCheckError

  errorMsg:
    # error message printed if grade not between 0 and 100 inclusive
    LDR r0, =errorStr
    MOV r1, r5
    BL printf

  endCheckError:

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data 
  errorStr: .asciz "ERROR: Grade %d is not on valid range [0,100]\n"
#end checkGradeValid


.text
# function to convert input quantitative grade in r1 (on range [0,100]) for student in r0 to letter grade and print it
printLetterGrade:

  # push stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # move student to r6 and grade to r5 for safe keeping
  MOV r5, r1
  MOV r6, r0

  # check if grade < 70 (F)
  CMP r5, #70
  BGE elif1
    MOV r1, r6
    MOV r2, r5
    LDR r0, =outputF
    BL printf
    B endif

  elif1:
    # check if grade < 80 && grade >= 70 (C)
    CMP r5, #80
    BGE elif2
      MOV r1, r6
      MOV r2, r5
      LDR r0, =outputC
      BL printf
      B endif

  elif2:
    # check if grade < 90 && grade >= 80 (B)
    CMP r5, #90
    BGE else
      MOV r1, r6
      MOV r2, r5
      LDR r0, =outputB
      BL printf
      B endif

  else:
    # check if grade >= 90 (A)
    MOV r1, r6
    MOV r2, r5
    LDR r0, =outputA
    BL printf

  endif:

  # pop stack and return
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  outputA: .asciz "%s earned grade A with an average of %d\n"
  outputB: .asciz "%s earned grade B with an average of %d\n"
  outputC: .asciz "%s earned grade C with an average of %d\n"
  outputF: .asciz "%s earned grade F with an average of %d\n"
# end printLetterGrade
