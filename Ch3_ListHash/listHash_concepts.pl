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

{
   print ("\n\nIterating through an array using an iterator.\n");
   print ("for <ITERATOR> (<LIST OR ARRAY>) <BLOCK>\n");
   our @continents = ("America", "Asia", "Europe", "Africa", "Australia", "Antarctica");
   for our $name  (@continents) {
      print ("${name}\n");
   }
   print ("Iterator can be used to change the value in an array.\n");
   our @numbers = (1, 2, 3, 4, 5, 6, 7);
   print ("Original array: @{numbers}\n");
   our $highestIndex = $#numbers;
   print ("The highest index in the array is $highestIndex.\n");
   for our $value (@numbers) {
      $value *= 2;
   }
   print ("After doubling: @{numbers}\n");
}

{
   print ("\nArray operations: pop, push, shift, unshift, sort\n");
   our @numbers = (1, 11, 12, 2, 3, 6, 4, 21, 97);
   print ("Original array: @numbers\n");
   print ('push @numbers, 99, 123');
   print ("\n");
   push @numbers, 99, 123;
   print ("After two pushes, new numbers are added at the end: @numbers\n");
   our $tail = pop @numbers;
   print ("After one pop, the $tail is removed: @numbers\n");
   print ('unshift (@numbers, 67');
   print ("\n");
   unshift(@numbers, 67);
   print ("After unshift, the new value is added to the head: @numbers\n");
   shift @numbers;
   print ("After shift, the array becomes @numbers\n");
   print ("Sort <Sort BLOCK> ARRAY. A new copy is returned\n");
   my @sorted_numbers = sort {$a <=> $b} @numbers;
   print ("After sorting: @sorted_numbers\n");
}

{
   print ("\nHash functions\n");
   my %where = (
      Gary => "Dallas",
      Lucy => "Exeter",
      Ian  => "Reading",
      Samantha => "Oregon"
   );
   print ("Key-value pairs in the hash function.\n");
   # Use the keys function to return the keys
   for (keys %where) {
      print ("$_: $where{$_}\n");
   }
   print ("Does Lucy exist as a key?\n");
   print (exists($where{Lucy}), "\n");
   print ("Delete Lucy.\n");
   delete $where{Lucy};
   print ("Does Lucy still exist as a key?\n");
   print (exists($where{Lucy}), "\n");
}