#include <iostream>

int match (char *s, char *t) {
 int count = 0;
 while (*s != *t) { count++; s++; t++; }
 return count;
}

int main (void)
{
 char s1[6] = "hello";
 char s2[6] = "ehohe";

 printf ("match: %d\n", match (s1, s2));
 printf ("match: %d\n", match (s1 + 2, s2 + 2));
 printf ("match: %d\n", match (&s1[3], &s2[3]));
 system("pause");
 return 0;
}
