#!/usr/bin/env perl
use v5.36;

# I am not 100% sure I understand this task

# in C, you get the memory locations as pointers, and you
# traverse an array by adding the memory size to the
# previous pointer. This contributes to C being a
# notorious foot-gun.

# You CAN print a memory location by using a reference
# and printing the reference instead of dereferencing it
# but because it's a reference, not a pointer, you don't
# do the dangerous, stack-smashing pointer arithmatic.

# So I guess I don't fully understand WHY you would want
# to do something like this, because "JUDGED DANGEROUS"
# trumps "CONSIDERED HARMFUL", but this kinda does it.

# I think.

my $x = 'weasel';
my $y = \$x;

say $x;
say $y;
say $y->$*;

