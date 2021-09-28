#! /usr/bin/perl

use strict;
use warnings;

{
   # Use =~ to detect matching
   # Use !~ to detect absence
   my $sentence = 
      "Nobody wants to hurt you... `cept, I do hurt people sometimes, Robert.\n";

   print ("$sentence");

   if ($sentence !~ /fish/) {
      print "There is no fish in the sentence.\n";
   }

   if ($sentence =~ /people/) {
      print "There is people in the sentence. \n";
   }

   # Literal is matched if all the 
   # characters it contains are matched.
   # Also, regexps are case-sensitive.
   if ($sentence =~ /I do/) {
      print ("'I do' matched.\n");
   }

   if ($sentence !~ /sometimes Robert/) {
      print ("'sometimes Robert' is NOT matched.\n");
   }
}

{
   my $sentence = 
      q("I wonder what the Entish word is for 'yet' and 'no'," he thought.);
   
   print ("\n\nSentence: $sentence.\n");
   #Add the modifier i after a regexp to turn off case-sensitivity
   my $regex = "entish";
   if ($sentence =~ /$regex/) {
      print ("Found /$regex/\n");
   }

   if ($sentence =~ /$regex/i) {
      print ("Found /$regex/i\n");
   } 

   print ("\nSome meta characters in regex are: \n");
   print (". * ? + [ ] ( ) { } ^ \$ | \\ \n");

   print (
         "To instruct regex to see all meta characters, as regular characters, use \\Q.
         To re-enable meta-character matching, use \\E. \n\n");
   
   print ("Match a period immediately followed by the end of the string. Use anchor \$\n");
   $regex = '\.$';
    if ($sentence =~ /$regex/) {
      print ("Found /$regex/\n");
   } 

   print ("Match 'I' at the beginning of the string. Use anchor ^\n");
   $regex = '^I';
   if ($sentence =~ /$regex/) {
      # No match, since the first character in the sentence
      # is " 
      print ("Found /$regex/\n");
   } 

   # Character classes
   print ("w[aoi]nder: match 'w', followed by any of 'a', 'o', or 'i', 
   then followed by 'nder'.\n");
   $regex = 'w[aoi]nder';
   if ($sentence =~ /$regex/) {
      # No match, since the first character in the sentence
      # is " 
      print ("Found /$regex/\n");
   }

   print ("th[^eo]: match 'th', followed by a character that is NOT 'e' or 'o'.\n");
   $regex = 'th[^eo]';
   if ($sentence =~ /$regex/) {
      # No match, since the first character in the sentence
      # is " 
      print ("Found /$regex/\n");
   }

   print ("Sets are denoted by []. Some sets have shortcuts. e.g. \n");
   print ("\\d,   [0-9],   Digits 0 to 9.\n");
   print ("\\D,   [^0-9],   Any non-digit.\n");

   print ("Alternative: |\n");
   print ("Character grouping: ()\n");
   print ("Match either 'th' followed by a whitespace or lower case letter, or 'or'.\n");
   print ('Regex: (th[\sa-z])|(or)');
   print ("\n");
   $regex = '(th[\sa-z])|(or)';
   if ($sentence =~ /$regex/) {
      print ("Found /$regex/\n");
   }

   print ("\n\nRepetition qualifiers.\n");
   print ("+: one or more times.\n");
   print ("*: zero or more times. \n");
   print ("?: zero or one time. \n");
   print ("{x,y}: from x to y times. \n");
   print ("{x, }: x times or more. \n");
   print ("{, y}: y times or fewer. \n");
   print ("{x}: exactly x times.\n");
}

{
   # Backreference
   print ("\n\n\nEach group, marked by a pair of ()s, is assigned a backreference, if matched.\n");
   my $sen =  '1: A silly sentence (495, a) *BUT* one which will be useful. (3)';
   print ("$sen\n");

   my $regex = '([a-z]+)(.*)([a-z]+)';
   if ($sen =~ /$regex/) {
      print ("\$1 is '$1'\n") if defined($1);
      # This one is greedy.
      # But it won't consume all the characters to the end.
      # Rather, it will leave the minimum number of characters
      # for the next group to be matched.
      print ("\$2 is '$2'\n") if defined($2);
      print ("\$3 is '$3'\n") if defined($3);
   }

   print ("\n The regular expression engine starts as soon as it can, 
   grabs as much as it can (unless you switch off greediness by adding ?), 
   then tries to finish as soon as it can, while taking the first decision available to it.\n");
}

{
   # Substitution
   my $sen = "that which is mine is also yours.\n";
   print ("Original:\n $sen");
   my $regex = 'is';
   my $sen_copy = $sen;
   $sen_copy =~ s/$regex/are/;
   print ("After single substitution with $regex:\n $sen_copy");

   $sen_copy = $sen;
   $sen_copy =~ s/$regex/are/g;
   print ("After global substitution with $regex (g modifier):\n $sen_copy");

   print ("Swapping every two words using substituion and backreference:\n");
   $regex = '(\w+)\s+(\w+)';
   $sen_copy = $sen;
   $sen_copy =~ s/$regex/$2 $1/g;
   print ($sen_copy);
}

{
   print ("Miscellaneous modifiers.\n");
   print ("/m: treat the string as multiple lines, using \\n as linebreak.\n");
   print ("/s: treat the string as a single line. Skips \\n.");
   print ("/g: perform substitution globally.\n");
   print ("/x: allow the use of whitespace and comments inside a match.\n");
}

{
   print ("Split and join.\n");
   my $sen = '/home/user/documents/cool.txt';
   print ("Original: $sen\n");

   # split [regex], <sentence>
   # Using # as the regex delimiter. Need to add 'm' in the front.
   print ("Splitting with / as the delimiter: \n");
   my @words = split m#/#, $sen;
   print ("@words\n"); 
   print ("words[0]: $words[0]\n");
   print ("words[1]: $words[1]\n");

   # join <string>, <sentence>
   my $new_sen = join "-", @words;
   print ("Joining with - : \n");
   print ($new_sen, "\n");
}

{
   print ("Transliteration operator: tr.\n");
   print ("Strictly speaking, this has nothing to do with regular exprression.\n");
   print ("But it is a powerful complement to regular expression.\n");

   print ("e.g. Replace a-g with 0-6");
   my $word = "cabbage";
   print ("Original: $word\n");
   # The return value of the operator is the number of characters matched.
   my $changed = $word =~ tr/a-g/0-6/;
   print ("New: $word. Number of changed characters: $changed.\n");

   print ("e.g. Counting the number of vowels.\n");
   $word = "Hello, this is Mother Goose One";
   my $numVowels = $word =~ tr/aeiouAEIOU//;
   print ("There are $numVowels vowels in '$word'\n.");
}