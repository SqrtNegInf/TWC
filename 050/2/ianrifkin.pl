#!/usr/bin/env perl
use v5.36;

my @L = (19,11,9,7,20,3,17,16,2,14,1); #List of number inputs

@L = sort { $a <=> $b } @L; #Sort numerically
# If assumption was untrue, splice dupes here?
my $length = scalar @L;
for (my $pos = 0; $pos < $length; $pos++) {
    #found a noble integer if it's value is equal to the amount of numbers after it
    say "Noble integer found: $L[$pos]" if $L[$pos] == $length - $pos - 1;
}
