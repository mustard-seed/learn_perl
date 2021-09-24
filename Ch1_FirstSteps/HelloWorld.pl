#! /usr/bin/perl

# Use strictures to catch error-prone styles
# Variable declared without scope, 
# bareword that is not a subroutine or a hash key
# symbolic reference
use strict;

# Enable warnings
use warnings;

print ("Hello, world.\n");
print ("Concatenating ", "Multiple ", "Strings ", "Together.", "\n");
