# Convert a decimal number less than 256 to binary
#! /usr/bin/perl

use strict;
use warnings;

print ("Please enter a number between 0 to 255 inclusively: ");
our $decimal_str = <STDIN>;
print ("\nYou entered: ${decimal_str}");

our $mask0 = 1;
our $bit0 = (($mask0 & $decimal_str) == $mask0) ? 1 : 0;
our $mask1 = 2;
our $bit1 = (($mask1 & $decimal_str) == $mask1) ? 1 : 0;
our $mask2 = 4;
our $bit2 = (($mask2 & $decimal_str) == $mask2) ? 1 : 0;
our $mask3 = 8;
our $bit3 = (($mask3 & $decimal_str) == $mask3) ? 1 : 0;
our $mask4 = 16;
our $bit4 = (($mask4 & $decimal_str) == $mask4) ? 1 : 0;
our $mask5 = 32;
our $bit5 = (($mask5 & $decimal_str) == $mask5) ? 1 : 0;
our $mask6 = 64;
our $bit6 = (($mask6 & $decimal_str) == $mask6) ? 1 : 0;
our $mask7 = 128;
our $bit7 = (($mask7 & $decimal_str) == $mask7) ? 1 : 0;
print<<EOF
   Least two digits of the binary: 
   0b${bit7}${bit6}${bit5}${bit4}${bit3}${bit2}${bit1}${bit0}\n
EOF

