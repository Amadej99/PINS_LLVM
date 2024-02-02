#include <stdio.h>

int power(int a, int b) {
    if (b == 0) 
        return 1;

    int c = a;
    for(int i = 0; i < b - 1; i++) {
        c = c * a;
    }
    return c;
}

int main() {
    int a = 5;
    int b = 4;
    int c = power(a, b);
    printf("%d\n", c);
}