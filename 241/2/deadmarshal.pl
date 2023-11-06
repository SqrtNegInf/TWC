#!/usr/bin/env perl
use v5.36;

use ntheory qw(factor);

sub prime_order{
  sort{factor($a) <=> factor($b) || $a <=> $b} @{$_[0]};
}

printf "(%s)\n", join ',',prime_order([11,8,27,4]);

