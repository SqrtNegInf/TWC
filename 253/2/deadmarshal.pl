#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0);

sub weakest_row{
  my ($mat) = @_;
  sort{sum0(@{$$mat[$a]}) <=> sum0(@{$$mat[$b]}) || $a <=> $b}
    0..$#$mat
}

print weakest_row([[1,1,0,0,0],
			[1,1,1,1,0],
			[1,0,0,0,0],
			[1,1,0,0,0],
			[1,1,1,1,1]]);
print weakest_row([[1,0,0,0],
			[1,1,1,1],
			[1,0,0,0],
			[1,0,0,0]]);

