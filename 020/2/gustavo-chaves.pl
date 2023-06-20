#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw/divisor_sum/;
use Memoize;

memoize('divisor_sum');

for (my $n=2; ; ++$n) {
    my $pds = divisor_sum($n) - $n;
    next if $n == $pds;

    my $pds_pds = divisor_sum($pds) - $pds;
    next if $n != $pds_pds;

    say "$n $pds";
    last;
}
