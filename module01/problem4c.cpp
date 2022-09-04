#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>

using namespace std;

char hex_table[17] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', '\0'}; 

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

    cout << "\nConverted integer: " << dec << " to hex: " << hex << "\n" << endl;

    return 0;
}
