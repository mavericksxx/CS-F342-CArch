Week-3
11/09/24

Write MALP for the following:

1. To read a number N from input and find if the number is odd or even. Display the result to the user.

2. To find the sum of the digits of a number N. Display the result to the user.

sum = 0;
while (N != 0)
{
      remainder = N % 10;
      sum       = sum + remainder;
      N         = N / 10;
}

3. Write the MIPS ALP for the high level code. Observe precedence and associativity rules.

   a  = a * b / c % d + e;
