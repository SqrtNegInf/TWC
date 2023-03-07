#!/usr/bin/env perl
use List::Util qw< pairkeys sum >;
print array_pairings((1, 2, 3, 4)), "\n";
sub array_pairings { sum pairkeys sort { $a <=> $b } @_ }
