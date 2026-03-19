// #include <stdio.h>
// #include <stdlib.h>
// #include <sys/types.h>

#include <stdio.h>
#include <stdlib.h>

uint rotate(uint num)
{
    uint a = 0;
    while (num)
    {
        a = a * 10 + num % 10;
        num /= 10;
    }
    return a;
}


int main(void)
{

}