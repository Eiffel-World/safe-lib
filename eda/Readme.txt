
EDA - Eiffel Decimal Arithmetic library, version 1.0.

EDA is an Eiffel implementation of the 
"General Decimal Arithmetic Specification" (GDAS, in the rest of this text) version 1.08 (see References, 1).

EDA is a part of the SAFE projects (http://safe.sourceforge.net).

By following the GDAS, this Eiffel implementation conforms to the 
requirements of the ANSI/IEEE standard 854-1987, while supporting integer and unrounded floating-point
arithmetic as a subset (see GDAS page 1).

The software included in this package is copyrighted freeware distributed
under the terms and conditions of the Eiffel Forum License as specified
in file License.txt.

Software dependencies
---------------------
EDA uses the multi-platform, multi-compiler GOBO 3.1 library (see References, 2).

Standard conformance 
--------------------
From the GDAS, this library implements

- Abstract representation of contexts : EDA_MATH_CONTEXT
    * 7 rounding modes : Round_up, Round_down, Round_ceiling, Round_floor, 
      Round_half_up, Round_half_down, Round_half_even
    * traps and signals

- Conversion operations : EDA_DECIMAL
    * to_scientific_string
    * to_engineering_string
    * to_number (as creation routine 'make_from_string') 
    *** Eiffel specific : make_from_integer, make_from_double, to_double, to_integer

- Arithmetic operations :
    * abs
    * add and subtract
    * compare
    * divide
    * divide-integer
    * max
    * min
    * minus and plus
    * multiply
    * normalize
    * remainder
    * rescale
    * round-to-integer
    *** Eiffel specific : +, -, *, /, //, \\

- ! Not Implemented :
    * remainder-near
    * square-root
    * power
    
References:
1. "General Decimal Arithmetic Specification" version 1.08, Mike Cowlishaw, 
   IBM UK Laboratories, http://www2.hursley.ibm.com/decimal.
2. GOBO 3.0. http://sourceforge.net/projects/gobo-eiffel; http://www.gobosoft.com

--
Copyright (c) 2002, Paul G. Crismer and others
December 1, 2002.

