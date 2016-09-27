ReadMe by William Gillespie
    The partial digest program implements Skiena's algorithm
to determine all of the locations of where an enzyme cuts the DNA.
To use the program, create a list of segment sizes and pass it
to the function.  Pass true to the second parameter if a trace
is desired.  The following is an example:

>> L1 = [1,5,9,4,8,4];
>> WilliamGillespie01(L1, true);
---- try y = 8
-------- try y = 5 FAILS
-------- try w - y = 4
------------solution found:0 4 8 9
---- try w - y = 1
-------- try y = 5
------------solution found:0 1 5 9
-------- try w - y = 4 FAILS