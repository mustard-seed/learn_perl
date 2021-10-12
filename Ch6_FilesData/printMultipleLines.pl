#! /usr/bin/perl

use warnings;
use strict;

# Purpose: parses all the files that are supplied as commandline arguments,
# - Print their content line by line
# - Print the name of a file before printing the first line from each file.
# - Reset the line number counter for each file.

# Perl provides a special file handler, <ARGV>, for files that are specified on the commandline.
# If no file is specified, then the standard input is accepted.
# Short hand for <ARGV> is <>

my $lineno;
my $currentFileName = "";

# shorthand: while (<>)
# We are using <ARGV> in a scalar context
while (defined($_ = <ARGV>)) {
   # Name of the file that the program is currently reading is stored in $ARGV
   if ($currentFileName ne $ARGV) {
      $lineno = 1;
      $currentFileName = $ARGV;
      print("\nPrinting from file $currentFileName.\n");
   }
   print ($lineno++);
   print (": $_");
}