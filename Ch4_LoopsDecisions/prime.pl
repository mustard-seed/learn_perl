#! /usr/bin/perl
# Purpose: List all the prime numbers between 2 and a number the user
# provides.
# Usage: decimal2Binary.pl <val>

use strict;
use warnings;

my $end = $ARGV[0];
chomp($end);
print ("Listing all the prime numbers from 2 to $end.\n");

foreach my $i (2..$end) {
   # Testing if the number if prime.
   foreach my $j (1..($i-1)) {
      if (($i % $j == 0) && ($j != 1)) {
         last;
      }
      # If none of the numbers from 2 to i-1 
      # can divide the number, 
      # then the number is a prime.
      if ($j == ($i-1)) {
         print ("$i is a prime number.\n");
      }
   }
}
