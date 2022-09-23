/*

Nick Hinke
09/04/2022
605.204 - Computer Organization
Module 1: Assignment 1

Problem 4D:
The purpose of this program is to convert an ASCII string of numbers to an integer in decimal format.

*/

#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>

using namespace std;

// function to convert ascii string of numbers to decimal integer
int ascii2dec(string ascii) {

    int int_val = 0;
    for (size_t i = 0; i < ascii.length(); i++) {
        int_val = int_val*10 + (ascii[i]-'0');
    }

    return int_val;

}

int main() {
    
    string ascii = "123987";
    int dec = ascii2dec(ascii);

    cout << "\nConverted ASCII string: '" << ascii << "' to decimal integer: " << dec << "\n" << endl;

    return 0;

}
