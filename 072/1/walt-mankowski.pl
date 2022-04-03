#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);
use Lingua::EN::Inflect qw(PL);

sub fact($n) {
    my $res = 1;
    $res *= $_ for 2..$n;
    return $res;
}

sub num_trailing_zeros($n) {
    my $cnt = 0;
    my $pwr = 10;
    while ($n % $pwr == 0) {
        $cnt++;
        $pwr *= 10;
    }
    return $cnt;
}

my $n = 10;
my $f = fact($n);
my $z = num_trailing_zeros($f);
say "$n as \$N! = $f has $z trailing ", PL("zero", $z);

