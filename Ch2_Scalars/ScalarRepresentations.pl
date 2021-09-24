#! /usr/bin/perl

use strict;
use warnings;

print ("A demostration on representing the same numbers in ");
print ("decimal, octal, and binary.\n");

print (255, " in decimal is 255.\n");
print (0377, " in octal is 0377.\n");
print (0b1111_1111, " in binary is 0b1111_1111.\n");
print (0xFF, " in hex-decimal is 0xFF.\n"); 

# The following are non-sensical, so will result in error
# print (255, " in decimal is 255.\n");
# print (0378, " in octal is 0378.\n");
# print (0b1111_1112, " in binary is 0b1111_1112.\n");
# print (0xFG, " in hex-decimal is 0xFG.\n"); 

print ("\n\n\n");
print ("A demonstration on printing a really large paragraph.\n");
print<<EOF;
This is a here-document. It starts on the line after the two arrows,
and it ends when the text following the arrows is found at the beginning
of a line, like this:

EOF

print ("\n\nA demonstration on converting string literal that contains numbers.\n");
print ("E.g. \"0x30\" as a string represents a hexadecimal number.\n");
print ("To convert it to decimal number, use the hex() function.\n");
print (hex("0x30"), "\n");

print ("E.g. \"030\" as a string represents an octal number.\n");
print ("To convert it to decimal number, use the oct() function.\n");
print (oct("030"), "\n");

print ("E.g. \"0b1101\" as a string represents a binary number.\n");
print ("To convert it to decimal number, also use the oct() function.\n");
print (oct("0b1101"), "\n");

print("\n\nA demostration on repeating a string using the x operator.\n");
print ("B(an)x4:\n");
print ("B", "an"x4, "\n");

print ("\n\nUsing the ord() function to find the ASCII value of a character.\n");
print ("ord(\"#\"): ", ord("#"), "\n");

print ("\n\nString comparison operators: eq, lt, gt, cmp\n");
my $str1 = "chicken";
my $str2 = "egg";
print ("String 1: $str1   String 2: $str2\n");
print ("Test one -- cmp: ", $str1 cmp $str2, "\n");
print ("Test two -- lt: ", $str1 lt $str2, "\n");
print ("Test three -- eq: ", $str1 eq $str2, "\n");
print ("Test four -- gt: ", $str1 gt $str2, "\n");

print ("\n\nPitfall: Do not use == to test equality between strings. Use eq instead.\n");
print ("String 1: $str1   String 2: $str2\n");
print ("Test one -- ==: ", $str1 == $str2, "\n");
print ("Test two -- eq: ", $str1 eq $str2);