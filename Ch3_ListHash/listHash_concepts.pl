#! /usr/bin/perl

use warnings;
use strict;

print ("A simple demostration of how list works in a list.\n");

# Use the qw() to instruction Perl to auotmatically 
# add single quotes around single word string elements
# Do not use comma to delimit in qw();
our @numbers = qw(
   one
   two
   three
   four
   five
);

print ("The list numbers contains @numbers.\n");
print ("The 3rd element in the numbers is $numbers[2].\n");


print ("\n\nA demonstration on list slices.\n");
our @numbers_small = @numbers[2, 3, 4];
print ("The 2nd element of number_small is $numbers_small[1].\n");

print("\n\nA list is a legal lvalue target in Perl.\n");
our $val0;
our $val1;
print ("Assign 4 and 7 to val0 and val1 respectively.\n");
($val0, $val1) = (4, 7);
print ("val0, val1: ", $val0, " ", $val1, "\n");
print ("Then we perform a swap of the two values.\n");
($val0, $val1) = ($val1, $val0);
print ("val0, val1: ", $val0, " ", $val1, "\n");

print ("\n\nRanges start with ..\n");
print ("Displaying the first 5 positive integers using range: ", (1..5), "\n");
print ("It's possible to mix range with slices.\n");
print (qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)[0..5, 10, 11], "\n");
print ("To get spaces between the elements during printing, declare an array.\n");
print ("During variable interpolation, quotes are added\n");
our @months = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
print ("@months\n");

print ("Assigning an array to a scalar vs stringifying.\n");
our $month_scalar_0 = @months;
# To stringfy, add double-quotes around the array during assignment.
our $month_scalar_1 = "@months";
print ("month_scalar_0: $month_scalar_0\n");
print ("month_scalar_1: $month_scalar_1\n");
