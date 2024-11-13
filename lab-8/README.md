13/11/24 Week-8

Write MALP for the following using procedures:
1. Power of a given number using recursion
    int power (int a, int n)
    {
        if (n==1)
            return a;
        return a * power(n-1)
    }
    main()
    {
        pow = power(a, n);
    }

2. Recursive binary search
    int bin_search(int A[], int data, int lo, int hi)
    {
        int mid;
        if (lo > hi) return -1
        mid = (lo + hi)/2;
        if (data == A[mid]) return mid
        if (data < A[mid]) return bin_search(A, data, lo, mid-1)
        return bin_search(A, data, mid, high+1)
    }