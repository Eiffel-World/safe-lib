	Eiffel portable STRING version 1.0 : Another STRING class which may be used when your compiler's STRING clas isn't enough.

Problems to solve :
- Some Eiffel compilers don't fully implement the elks95 class interface so
 it is rather difficult to write an application that is compatible with the existing compilers.
- Some compilers added interesting but incompatible features.


The aim of ELKS_STRING is to support the full interface of the class STRING as defined in elks95 + other usefull features. 
ELKS_STRING should work on all compilers supported by GOBO Eiffel version 1.5.
ELKS_STRING has been designed to help solving compatibility problems encountered when writing or making legacy applications portable for
current Eiffel compilers (look at doc/requirements.html). 
ELKS_STRING is not a descendant of STRING (look at the caveats of the inheritance techniqe described in gobo/doc/portability/inheritance.html why this choice has been made). 
ELKS_STRING uses the STRING class of your compiler for it's implementation.
ELKS_STRING is best used in the implementation of your features when you need a feature of string that isn't available in your STRING class in a portable manner.
It is recommended to continue to use STRING in the public interface of your classes.

To use this ELKS_STRING you need Gobo 1.5 or later from http://www.gobosoft.com  (Copyright (c) 1999, Eric Bezault mailto:ericb@gobosoft.com).
 

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--