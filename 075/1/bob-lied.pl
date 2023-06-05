#!/usr/bin/env perl
use v5.36;

use lib ".";
use CoinSum qw(coinSum);

sub Usage { "Usage: $0 SUM coin1 [coin2..coinN]" };

my $S = 6; my @C = <1 2 4>;

die Usage() unless $S;
die Usage() unless @C;


my $result = coinSum($S, @C);

say "[ @$_ ]" foreach @$result;
