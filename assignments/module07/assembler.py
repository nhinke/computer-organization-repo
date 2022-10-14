# Nick Hinke
# 10/16/2022
# 605.204 Computer Organization
# Module 7 Assignment - Problem 1
#
# Create an assembler that converts ARM assembly to machine code for armv7l
# Note: always assumes Condition Code is 1110 (doesn't handle branching) 
#

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
        splitAfterBracket = fullInstruction.split('[')[1].split(',')
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
            if ('#' in instruct):
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

def checkNullVal(input):
    if (input == nullVal):
        print('Please enter an invalid assembly instruction')
        exit(1)

def main():
    
    instruct = input('Please enter an assembly instruction: ')
    splitInstruct = instruct.split(' ')

    opType = getOpType(splitInstruct[0])
    checkNullVal(opType)

    opTypeFormat = getFullOpTypeFormat(opType, instruct)
    checkNullVal(opTypeFormat)

    opCode = getOpCode(opTypeFormat, instruct)
    checkNullVal(opCode)

    print(f'opType: {opType}')
    print(f'format: {opTypeFormat}')
    print(f'opCode: {opCode}')

    opTypeVal = OpTypes[opTypeFormat]
    opCodeVal = (OpCodes[opType])[opCode]
    print('\n')
    print(f'OpTypeVal: {opTypeVal}')
    print(f'OpCodeVal: {opCodeVal}')


if __name__ == "__main__":
    main()
    