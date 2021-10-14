#! /usr/bin/perl

use warnings;
use strict;

{
   # Anonymous vs explicit references.
   # To dereference a reference, just put a pair of {} around the reference.
   my @array = (1, 2, 3, 4, 5);
   # Explicit reference: putting a backslash in front of the variable.
   my $array_ref = \@array;
   print ("The 2nd element from the array, using reference: ${$array_ref}[1].\n"); 

   # Anonymous reference: to get an array reference instead of an array, use square brackets [] instead of ().
   $array_ref = [2, 4, 6, 8, 10];
   print ("The 2nd element from a new array, using anonymous reference: ${$array_ref}[1].\n");

   # Anonymous reference: to get a hash reference instead of a hash, use curly braces {} instead of ().
   my $hash_ref = {apple=>"pomme", pear => "poire"};
   print ("Hash reference: ");
   print ('${$hash_ref}{pear}=');
   print (${$hash_ref}{pear}, "\n");

   # Much cleaner way for deferencing
   print ("Cleaner dereference: ");
   print ('$hash_ref->{pear}=');
   print ("$hash_ref->{pear}\n");
}

{
   # autovivification: references are automatically created if necessary

   my $ref;
   $ref->{UK}->{England}->{Oxford}->[1999]->{Population} = 500000;

   # Equivalent to
   # $ref = {}
   # $ref->{UK} = {}
   # $ref->{UK}->{Oxford} = {}
   # ...
}