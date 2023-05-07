#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

use Math::Prime::Util qw< prime_iterator >;

my $it = prime_iterator;

say my $pri = 1; # P(0) = 1 by definition
say $pri *= $it->() for 1..$ARGV[0] // 10;
