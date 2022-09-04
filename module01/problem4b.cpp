/*

Nick Hinke
09/04/2022
605.204 - Computer Organization
Module 1: Assignment 1

Problem 4B:
The purpose of this program is to convert a string in binary format to a string in hex format.

*/

#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>

using namespace std;

// global hex character lookup table
char hex_table[17] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', '\0'}; 

// function to convert binary string to hex string
string bin2hex(string bin) {

    string hex = string("0x");

    // remove leading "0b" if present
    if (bin[0] == '0' && bin[1] == 'b') {
        bin = bin.substr(2);
        // cout << "Removed leading 0b from binary number input to get: " << bin << endl;
    }

    // check number of bits divisible by four
    if ((bin.length() % 4) != 0) {
        cout << "Error: number of bits in binary number not divisible by four" << endl;
        exit(1);
    }
    int num_hex_digits = bin.length() / 4;
    
    // break into groups of four bits and convert each group to hex
    int hex_int_value;
    string hex_digit_str;
    for (int i = 0; i < num_hex_digits; i++) {
        hex_digit_str = bin.substr(i*4, 4);
        hex_int_value = (hex_digit_str[0]-'0')*8 + (hex_digit_str[1]-'0')*4 + (hex_digit_str[2]-'0')*2 + (hex_digit_str[3]-'0')*1;
        hex += hex_table[hex_int_value];
    }

    return hex;

}

int main() {

    string bin = "0b10100011";
    string hex = bin2hex(bin);

    cout << "\nConverted binary string: '" << bin << "' to hex string: '" << hex << "'\n" << endl;

    return 0;

}
