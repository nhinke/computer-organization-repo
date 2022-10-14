# ARM assembly instructions to test:
ADD r2, r6, #41            @ should yield instruction: 0xe2862029
ADD r0, r1, r2             @ should yield instruction: 0xe0810002
SUB r5, r6, r2, LSR r1     @ should yield instruction: 0xe0465132
MUL r1, r2, r3             @ should yield instruction: 0xe0010392
MLA r1, r2, r3, r4         @ should yield instruction: 0xe0214392
MOV r1, #2080              @ should yield instruction: 0xe3a01e82
LSL r1, r2, #3             @ should yield instruction: 0xe1a01182 (instruction equivalent to: MOV r1, r2, LSL #3)
ASR r1, r2, r3             @ should yield instruction: 0xe1a01352 (instruction equivalent to: MOV r1, r2, ASR r3)
LDR r1, [r2, #1025]        @ should yield instruction: 0xe5921401
LDR r1, [r2, #-1025]       @ should yield instruction: 0xe5121401
STR r1, [r2, r3, LSL #23]  @ should yield instruction: 0xe7821b83

# compile with: 
#     gcc TestMachineCode.s -c -o TestMachineCode.o
# then use objdump with disassemble flag:
#     objdump TestMachineCode.o -d
