#!/usr/bin/env perl
use v5.36;

#die "\nPlease provide positive integer for input\n" if (!@ARGV);
my $number = $ARGV[0] // 200;
my $i;

my @nums = (2..$number); # Create array of numbers from 2 up to user input number.
my @final = grep(!/1/, @nums); # Create new array not including numbers that have a 1.

my $count = scalar @final; # Get length of new array.

print "Input: \$N = $number\n";
print "Output: $count\n\n";

print "There are $count numbers between 1 and $number that don't contain the digit 1\n";
print "@final\n";
