#!/usr/bin/env perl
use v5.36;

#
# You are given 2 strings, $A and $B.
# 
# Write a script to find out common base strings in $A and $B.
# 
#   A substring of a string $S is called base string if repeated
#   concatenation of the substring results in the string.
#

chomp (my $A = <DATA>);
chomp (my $B = <DATA>);

#
# Sort the strings by length, so $A isn't longer than $B.
#
($A, $B) = ($B, $A) if length $B < length $A;

#
# Find a substring which cannot be part of either string,
# nor of its concatenation.
#
my $sep = "\x00" x (1 + length ($A) + length ($B));

#
# Now, use a regular expression to find common base strings.
#
$_ = "$A$sep$B";
/^ (.+) \1*     # Find base strings of $A
   $sep         # Match the separator
   \1+ $        # Must be base string for $B
   (?{say $1})  # Print it
   (*FAIL)      # Backtrack so we can try other base strings.
/x;

__END__
abcdabcd
abcdabcdabcdabcd
