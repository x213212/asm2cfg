#include <stdio.h>

__attribute__((noinline)) int action(int value) {
    volatile int result = value;
    return result;
}

__attribute__((noinline)) int dispatch(unsigned index, int value) {
    switch (index) {
    case 0: return action(value + 3);
    case 1: return action(value * 3);
    case 2: return action(value ^ 7);
    case 3: return action(value - 5);
    case 4: return action(value | 19);
    case 5: return action(value & 11);
    case 6: return action(value + 42);
    case 7: return action(value * 5);
    default: return -1;
    }
}

int main(void) {
    for (unsigned index = 0; index < 10; ++index)
        printf("%d\n", dispatch(index, 10));
    return 0;
}
