#! /usr/bin/perl

use warnings;
use strict;

# Purpose: For the given text file, print the first line of each paragraph and label it.
# Doesn't work as expected. Only the first line from the first paragraph is printed.

# Set the special record seperator variable.
# If this is set to empty, then paragraphs seperated by empty lines will be read in.
# Gottcha: use /, instead of \.
$/ = "\n\n";
my $parano = 1;

# Keep reading in paragraphs
while (<>) {
   # Split the current paragraph
   my @lines = split(/\n/, $_);
   print $parano++;
   print (": $lines[0]\n");
}