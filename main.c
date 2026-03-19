// #include <stdio.h>
// #include <stdlib.h>
// #include <sys/types.h>

#include <stdio.h>


void reverse()
{
    int a;
    scanf("%d", &a);
    if (a == 0) return;
    if (a % 2 == 1)
    {
        printf("%d ", a);
        reverse();
    }
    else
    {
        reverse();
        printf("%d ", a);
    }
}

int main(void) { reverse(); }