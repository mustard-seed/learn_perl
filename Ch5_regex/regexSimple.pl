#! /usr/bin/perl

# Trying out some simple regular expressions

use strict;
use warnings;

{
   my $regex = '(\w+)$';
   print ("Regex: =~ /$regex/.\n");
   print ("Meaning: match one or more alphanumerical at the end of the string.\n");

   my $sentence = "Hello, 123, this is a nice day2you";
   print ("Sentence: |$sentence|\n");
   $sentence =~ /$regex/;
   print ("Match 1: |$1|\n");
}

{
   my $regex = '^#';
   print ("Regex: !~ /$regex/.\n");
   print ("Meaning: match for a string that does not start with #\n");

   my @sentences = (
      "#Hello, 123, this is a nice day2you",
      "Yet another sentence."
   );
   foreach my $i (@sentences) {
      print ("Sentence: |$i|\n");
      if ($i !~ /$regex/) {
         print ("Sentence does not start with #.\n");
      } 
      else {
         print ("Sentence starts with #.\n");
      }
   }
}

{
   my $regex = '#{2,}';
   my $replace = '#';
   print ("Regex: s/$regex/$replace/g.\n");
   print ("Meaning: replace two or more consecutive #s with one # throughout the string.\n");

   my $sentence = "Lalala, #, I have #### three stars, 123##3.";
   print ("Sentence: |$sentence|\n");
   $sentence =~ s/$regex/$replace/g;
   print ("After replacement: |$sentence|\n");
}


