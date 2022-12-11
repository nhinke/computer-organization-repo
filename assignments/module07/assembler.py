# Nick Hinke
# 10/16/2022
# 605.204 Computer Organization
# Module 7 Assignment - Problem 1
#
# Create an assembler that converts ARM assembly to machine code for armv7l
# Note: always assumes Condition Code is 1110 (doesn't handle branching) 
#

import sys

nullVal = 'null'
ldstInstructions = set({'ldr','str'})
arthInstructions = set({'add','sub'})
multInstructions = set({'mul','mla'})
logcInstrcutions = set({'and','orr','eor'})
moveInstructions = set({'mov','mvn'})
shftInstructions = set({'lsl','lsr','asr','ror','rrx'})
dataInstructions = set().union(*list([moveInstructions, shftInstructions, logcInstrcutions, multInstructions, arthInstructions]))

OpTypes = dict({'dataIMM': '001', 'dataREG': '000', 'ldstIMM': '010', 'ldstREG': '011'})

ldstOpCodes = dict({'add': '1100', 'sub': '1000'})
dataOpCodes = dict({'add': '0100', 'sub': '0010', 'mul': '0000', 'mla': '0001', 'and': '0000', 'orr': '1100', 'eor': '0001', 'mvn': '1111', 'mov': '1101', 'lsl': '1101', 'lsr': '1101', 'asr': '1101', 'ror': '1101', 'rrx': '1101'})
OpCodes = dict({'ldst': ldstOpCodes, 'data': dataOpCodes})

shiftTypes = dict({'mov': '00', 'lsl': '00', 'lsr': '01', 'asr': '10', 'ror': '11', 'rrx': '11'})

def getCondCode():
    # TODO extend functionality here
    return '1110'

def getOpType(instruction):
    instruction = instruction.lower()
    if (instruction in ldstInstructions):
        optype = 'ldst'
    elif (instruction in dataInstructions):
        optype = 'data'
    else:
        optype = nullVal
    return optype

def getFullOpTypeFormat(optype, fullInstruction):
    if (optype != 'ldst' and optype != 'data'):
        return nullVal
    fullInstruction = fullInstruction.lower()
    if (optype == 'ldst'):
        splitAfterBracket = fullInstruction.split('[')[1].split(',') # TODO what if there's no [ ?
        if (len(splitAfterBracket) == 3):
            format = 'ldstREG'
        elif (len(splitAfterBracket) == 2):
            format = 'ldstIMM'
        else:
            format = nullVal
    elif (optype == 'data'):
        # TODO: check all these --> especially logic instructions
        instruct = fullInstruction.split(' ')[0].lower()
        if (instruct in multInstructions or instruct in shftInstructions):
            format = 'dataREG'
        elif (instruct in moveInstructions):
            format = 'dataIMM'
        elif (instruct in logcInstrcutions or instruct in arthInstructions):
            if ('#' in fullInstruction):
                format = 'dataIMM'
            else:
                format = 'dataREG'
        else:
            format = nullVal
    return format

def getOpCode(optype, fullInstruction):
    if (optype not in OpTypes.keys()):
        return nullVal
    if ('ldst' in optype):
        splitAfterPound = fullInstruction.split('#')[1]
        if ('-' in splitAfterPound):
            opcode = 'sub'
        else:
            opcode = 'add'
    elif ('data' in optype):
        instruct = fullInstruction.split(' ')[0].lower()
        if (instruct in dataInstructions):
            opcode = instruct
        else:
            opcode = nullVal
    return opcode

def getLSbit(optype, fullInstruction):
    if (optype not in OpTypes.keys()):
        return nullVal
    if ('ldst' in optype):
        firstInstruct = fullInstruction.split(' ')[0].lower()
        if ('str' in firstInstruct):
            LSbit = '0'
        elif ('ldr' in firstInstruct):
            LSbit = '1'
        else:
            LSbit = nullVal
    elif ('data' in optype):
        # TODO extend functionality here 
        LSbit = '0'
    return LSbit

def getRdRt(fullInstruction):
    firstReg = fullInstruction.split(' ')[1].lower()
    reg = (firstReg.split(',')[0]).split('r')[1]
    return reg

def getRn(fullInstruction):
    instruct = fullInstruction.split(' ')[0].lower()
    if (instruct in moveInstructions or instruct in shftInstructions or instruct == 'mul'):
        reg = '0'
    elif (instruct == 'mla'):
        lastReg = fullInstruction.split(' ')[-1].lower()
        reg = (lastReg.split(']')[0]).split('r')[1]
    else:
        secondReg = fullInstruction.split(' ')[2].lower()
        reg = (secondReg.split(',')[0]).split('r')[1]
    return reg

def getNbits(regVal, *, N=4):
    n = N-1
    regValStr = str(regVal)
    regVal = int(regVal)
    bits = str()
    for n in range(3, -1, -1):
        if (regVal - (2**n) >= 0):
            bits += "1"
            regVal -= (2**n)
        else:
            bits += "0"
    if ((regVal) > 0):
        raise Exception(f'Overflow error: not enough bits ({N}) to represent number ({origVal})...')
    return bits

def getRegisterValues(instruction, *, Rn, RdRt):
    instruction = instruction.lower()
    if (instruction not in ldstInstructions and instruction not in dataInstructions):
        return nullVal
    if (instruction == 'mla'):
        regBits = str(getNbits(RdRt)) + str(getNbits(Rn))
    elif (instruction == 'mul'):
        regBits = str(getNbits(RdRt)) + str('0000')
    else:
        regBits = str(getNbits(Rn)) + str(getNbits(RdRt))
    return regBits

def getOperand2(fullInstruct):
    return '000000000000'

def checkNullVal(input):
    if (input == nullVal):
        print('Please enter a valid assembly instruction')
        exit(1)

def main(inputInstruction = None):
    
    if (not inputInstruction):
        inputInstruction = input('Please enter an assembly instruction: ')
    splitInstruct = inputInstruction.split(' ')

    condCode = getCondCode()
    checkNullVal(condCode)

    opType = getOpType(splitInstruct[0])
    checkNullVal(opType)

    opTypeFormat = getFullOpTypeFormat(opType, inputInstruction)
    checkNullVal(opTypeFormat)

    opTypeVal = OpTypes[opTypeFormat]
    checkNullVal(opTypeVal)

    opCode = getOpCode(opTypeFormat, inputInstruction)
    checkNullVal(opCode)

    opCodeVal = (OpCodes[opType])[opCode]
    checkNullVal(opCodeVal)

    lsBit = getLSbit(opTypeFormat, inputInstruction)
    checkNullVal(lsBit)

    RdRt = getRdRt(inputInstruction)
    checkNullVal(RdRt)

    Rn = getRn(inputInstruction)
    checkNullVal(Rn)

    twoRegisters = getRegisterValues(splitInstruct[0], Rn=Rn, RdRt=RdRt)
    checkNullVal(twoRegisters)

    operand2bits = getOperand2(inputInstruction)
    checkNullVal(operand2bits)


    print(f'opType: {opType}')
    print(f'format: {opTypeFormat}')
    print(f'opCode: {opCode}')
    print(f'Rd: {RdRt}')
    print(f'Rn: {Rn}')


    print(' ')
    print(f'CondCode:  {condCode}')
    print(f'OpTypeVal: {opTypeVal}')
    print(f'OpCodeVal: {opCodeVal}')
    print(f'LSbitVal:  {lsBit}')
    print(f'two regs:  {twoRegisters}')
    print(f'operand2:  {operand2bits}')

    fullMachineCode = str(condCode) + str(opTypeVal) + str(opCodeVal) + str(lsBit) + str(twoRegisters) + str(operand2bits)
    spacedMachineCode = "0b" + str(condCode) + " " + str(opTypeVal) + str(opCodeVal[0]) + " " + str(opCodeVal[1:]) + str(lsBit) + " " + str(twoRegisters[:4]) + " " + str(twoRegisters[4:]) + " " + str(operand2bits[:4]) + " " + str(operand2bits[4:8]) + " " + str(operand2bits[8:])
    print(' ')
    print(f'{inputInstruction}')
    print(f'{fullMachineCode}')
    print(f'{spacedMachineCode}')
    print(' ')


if __name__ == "__main__":
    instructions = list()
    instructions.append("ADD r2, r6, #41")
    instructions.append("ADD r0, r1, r2")
    instructions.append("MUL r1, r2, r3")
    instructions.append("MLA r1, r2, r3, r4")
    instructions.append("MOV r1, #2080")
    instructions.append("LSL r1, r2, #3")
    instructions.append("ASR r1, r2, r3")
    instructions.append("LDR r1, [r2, #1025]")
    instructions.append("LDR r1, [r2, #-1025]")
    instructions.append("STR r1, [r2, r3, #23]")
    for instruct in instructions:
        main(instruct)
    