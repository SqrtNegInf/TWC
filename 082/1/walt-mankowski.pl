#!/usr/bin/env perl
use v5.36;

use Set::Scalar;

my ($m, $n) = (100, 500);
local $, = ", ";
my $s1 = factors($m);
my $s2 = factors($n);
say $s1->intersection($s2);

sub factors($n) {
    my $s = Set::Scalar->new(1);
    for my $i (2..sqrt($n)) {
        $s->insert($i, $n / $i) if $n % $i == 0;
    }

    return $s;
}

