#! /usr/bin/perl

# Some parsing using regular expressions

use strict;
use warnings;

my $gettysburgOriginal = <<"EOF";
Four score and seven years ago our fathers brought forth, on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.
Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battle-field of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.
But, in a larger sense, we can not dedicate—we can not consecrate—we can not hallow—this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract.
The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced.
It is rather for us to be here dedicated to the great task remaining before us—that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion—that we here highly resolve that these dead shall not have died in vain—that this nation, under God, shall have a new birth of freedom—and that government of the people, by the people, for the people, shall not perish from the earth.
EOF

print ("The Gettysburg Address before modification: \n");
print ("$gettysburgOriginal\n");

# Count the number of occurances of the word "we".
{
   my $num = 0;
   my $regex = '\b[Ww]e\b';
   # Regular expression match returns a list of matches
   my @list = $gettysburgOriginal =~ /$regex/g;
   my $size = @list;
   print ("There are $size 'we' or 'We' in the address.\n");
}

# Reformat each sentence into its own paragraph
{
   my $copy = $gettysburgOriginal;
   #my $copy = "Hello, one. Hello, two.";
   my $regex = '([[:alpha:]][^.]*\.)\s*';
   # GOTTCHA: Can you spot what's wrong with regex the below?
   # my $regex = '([[:alpha:]][^.]*\.^\n)';
   # Instead, is should be
   # my $regex = '([[:alpha:]][^.]*\.[^\n])';
   #my $regex = '\.';
   my @list = $copy =~ s/$regex/$1\n/g;
   print ($copy);
}

# Extract the first word of every sentence.
{
   my $copy = $gettysburgOriginal;
   # Use ?: to mark a grouping that is not counted toward backreference.
   my $regex = '(?:^|(?:\.\s+))(\w+)';
   my @list = $copy =~ /$regex/g;
   foreach my $word (@list) {
      print ("Word: |$word|\n");
   }
}