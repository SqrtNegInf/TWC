#!/usr/bin/env perl
#
# Challenge 1: "Create a script that accepts two strings, let us call it,
# "stones" and "jewels". It should print the count of "alphabet" from the
# string "stones" found in the string "jewels". For example, if your stones
# is "chancellor" and "jewels" is "chocolate", then the script should print
# "8". To keep it simple, only A-Z,a-z characters are acceptable. Also
# make the comparison case sensitive."
# 
# My notes: Not very clearly defined, but to get 8 in the example, I infer
# that it means "form a set from the first string (thus ignoring repeated
# letters) and then count up how many occurrences of each letter in that set
# in the second word".  That's trivial, let's do it.
# 

use v5.10;	# to get "say"
use strict;
use warnings;

my($word1,$word2) = ('chancellor', 'chocolate');

# form a set of the letters in $word1 (case sensitive)
my %set = map { $_ => 1 } split(//, $word1);

# form a bag of the letters in $word2
my %bag;
map { $bag{$_}++ } split( //, $word2 );

# now, count up sum of bag elements for everything in set
my $t = 0;
foreach my $letter (keys %set)
{
	$t += $bag{$letter} if defined $bag{$letter};
}
say $t;
