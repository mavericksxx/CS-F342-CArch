Week-4 
18/09/2024
Array Access

Write MALP for the following:

1. length = 10
array[10] = {1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554};
for (i = 0 ; i< length; i++)
	printf("%d\n",array[i]);

2. Linear search
length = 10
array[10] = {1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554};
x = 5;
for (i = 0; i < length; i++) 
    if (array[i] == x) 
    {
	printf("Element found at position %d", i);
	return;
    }
printf("Element not found");

3. Assume you have two word arrays A and B that have 5 elements each. Assume the elements of the arrays are stored in memory. Sum the corresponding elements of the two arrays A and B and store the result in word array C kept in memory. Display the elements of array c to user.

length = 5
A[5] = {1, 2, 3, 4, 5};
B[5] = {1, 2, 3, 4, 5};

for (i = 0 ; i< 5; i++)
	C[i] = A[i] + B[i]

printf("The sum is")
for (i = 0 ; i< 5; i++)
	printf("%d\n", C[i]);
