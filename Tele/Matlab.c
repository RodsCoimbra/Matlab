#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Programa que transforma números separados com virgulas em formato matlab, ou seja, separados por um espaço

void main()
{
    char str[200], str2[200];
    fgets(str, 199, stdin);
    int i, j = 0;
    printf("\e[1;1H\e[2J");
    char troca = ' ', procura = ',', procura2 = ' ';
    for (i = 0; str[i] != '\n'; i++, j++)
    {
        if (str[i] == procura)
        {
            str2[j] = troca;
        }
        else if (str[i] == procura2)
        {
            j--;
        }
        else
        {
            str2[j] = str[i];
        }
    }
    str2[j] = '\0';
    printf("\n[%s]\n\n", str2);
}