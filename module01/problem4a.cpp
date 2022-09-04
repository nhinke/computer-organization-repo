#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>

using namespace std;

string toUpper(string in) {
    string out = in;
    for (size_t i = 0; i < in.length(); i++) {
        out[i] = in[i] & ~0x20;
    }
    return out;
}

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

    cout << "\nConverted lowercase: " << lower << "   to uppercase: " << toUpper(lower) << endl;
    cout << "Converted uppercase: " << upper << " to lowercase: " << toLower(upper) << "\n" << endl;

    return 0;
}
