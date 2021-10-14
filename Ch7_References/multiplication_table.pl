#! /usr/bin/perl

# Purpose:
# Implementing a multiplication table using an array of arrays
# e.g. 1
# perl mutliplication_table.pl 2 6
# two times six is twelve
# e.g. 2
# perl mutliplication_table.pl -2 6
# -2 is out of found. Please make sure the multiplicand and the multiplier are both between 0 and 9 inclusively
# e.g. 3
# perl multiplication_table.pl 2 6 3
# Please enter only two inputs seperated by space.


use warnings;
use strict;

# Declare the multiplication by "x" arrays, and the main table.
my $zeroX_ref, my $oneX_ref, my $twoX_ref, my $threeX_ref, my $fourX_ref, 
   my $fiveX_ref, my $sixX_ref, my $sevenX_ref, my $eightX_ref, my $nineX_ref;
my @table = ($zeroX_ref, $oneX_ref, $twoX_ref, $threeX_ref, $fourX_ref, $fiveX_ref, $sixX_ref, $sevenX_ref, $eightX_ref, $nineX_ref);

# Trick: Generate the tables by using "map" to apply multiplication to a list of indices.
# map {expression} List: Evaluates expression for each element of List. Any $_ in expression is replaced by an element in the list.
# Returns the new list in array context.
# Returns the list of the array in scalar context
my @indices = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
my @text = qw(zero one two three four five six seven eight nine);
for my $i (@indices) {
   $table[$i] = [map {$_ * $i} @indices];
}

if (scalar(@ARGV) != 2) {
   die "Number of arguments should be between exactly two, stopped";
}

if ($ARGV[0] < 0 || $ARGV[0] > 9 || $ARGV[1] < 0 || $ARGV[1] > 9) {
   die "Both arguments need to be between 0 and 9 inclusively, stopped";
}

print ("$text[$ARGV[0]] times $text[$ARGV[1]] is ", $table[$ARGV[0]]->[$ARGV[1]]);

