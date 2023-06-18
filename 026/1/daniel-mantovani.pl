#!/usr/bin/env perl
use v5.36;

# let's read the two strings from command line
my ( $stones, $jewels ) = ('chancellor', 'chocolate');

my $n = 0;

# we just count the times each char from $stones exists in $jewels

$n += $jewels =~ /$_/ for split '', $stones;

# and I think that's it, unless I misunderstood the challenge (which is very likely)

say "$stones letters found in $jewels are $n in total";
