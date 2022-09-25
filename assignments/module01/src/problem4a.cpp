/*

Nick Hinke
09/04/2022
605.204 - Computer Organization
Module 1: Assignment 1

Problem 4A:
The purpose of this program is to convert all characters in a string to uppercase or lowercase as desired.

*/

#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>

using namespace std;

// function to force all chars in input string to uppercase
string toUpper(string in) {
    string out = in;
    for (size_t i = 0; i < in.length(); i++) {
        out[i] = in[i] & ~0x20;
    }
    return out;
}

// function to force all chars in input string to lowercase
string toLower(string in) {
    string out = in;
    for (size_t i = 0; i < in.length(); i++) {
        out[i] = in[i] | 0x20;
    }
    return out;
}

int main() {
    
    string lower = "hello";
    string upper = "GOODBYE";

    cout << "\nConverted lowercase string: '" << lower << "'   to uppercase string: '" << toUpper(lower) << "'" << endl;
    cout << "Converted uppercase string: '" << upper << "' to lowercase string: '" << toLower(upper) << "'\n" << endl;

    return 0;

}
