/*

Nick Hinke
09/04/2022
605.204 - Computer Organization
Module 1: Assignment 1

Problem 4C:
The purpose of this program is to convert an integer in decimal format to a string in hex format.

*/

#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>

using namespace std;

// global hex character lookup table
char hex_table[17] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', '\0'}; 

// function to convert decimal integer to hex string
string dec2hex(int dec) {

    string hex = string("0x");

    // get size of integer input (typically four bytes)
    int num_bytes = sizeof(dec);

    // set constant bit mask of 0...01111
    const int mask = 1*(2*2*2) + 1*(2*2) + 1*(2) + 1*(1); 

    // use right bit shifts and masking to find hex int values in reverse order
    int hex_vals[num_bytes*2];
    for (int i = 0; i < num_bytes*2; i++) {
        hex_vals[num_bytes*2-(i+1)] = (dec>>(i*4) & mask);
    }

    // convert hex int values to hex string
    for (int i = 0; i < num_bytes*2; i++) {
        hex += hex_table[hex_vals[i]];
    }

    return hex;

}

int main() {

    int dec = 123456;
    string hex = dec2hex(dec);

    cout << "\nConverted decimal integer: " << dec << " to hex string: '" << hex << "'\n" << endl;

    return 0;

}
