#include <stdio.h>
#include <stdlib.h>

int power(int a, int b) {
    if (b == 0) 
        return 1;

    int c = a;
    for(int i = 0; i < b - 1; i++) {
        c = c * a;
    }
    return c;
}

int main(int argc, char* argv[]) {
    int c = power(atoi(argv[1]), atoi(argv[2]));
    printf("%d\n", c);
}