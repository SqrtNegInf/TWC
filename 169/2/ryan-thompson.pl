#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

use Math::Prime::Util qw< gcd factor_exp >;
use        List::Util qw< all any >;

say for achilles($ARGV[0] // 2000);

sub achilles {
    map  { $_->[0] }
    grep { all { $_ > 1 } @{$_->[1]} and gcd(@{$_->[1]}) == 1 }
    map  { [ $_ => [ map { $_->[1] } factor_exp($_) ] ] } 2..$_[0];
}
