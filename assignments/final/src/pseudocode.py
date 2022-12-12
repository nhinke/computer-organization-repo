# Nick Hinke
# 12/11/2022
# 605.204 Computer Organization
# Final - Problem 18 Pseudocode
#
# Pseudocode for problem 18, see src/loopingIntegerInputStats.s for actual code written in ARM assembly
#

import math

def main():

    # initialize variables
    numIntsEntered = 0
    runningTotal = 0

    # collect arbitrary number of integer inputs
    inputInt = input("Please enter an integer, or -1 to stop: ")
    while (int(inputInt) != -1):
        numIntsEntered += 1
        runningTotal += int(inputInt)
        inputInt = input("Please enter an integer, or -1 to stop: ")

    # compute average (and truncate to simulate integer division) and print result
    averageInput = runningTotal/numIntsEntered
    print(f"You entered {numIntsEntered} valid integers, that totaled {runningTotal}, which yields an average of {math.floor(averageInput)}...")

if __name__ == "__main__":
    main()
