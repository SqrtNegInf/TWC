#!/usr/bin/env perl

use v5.36;
use List::Util qw/uniqint/;

sub si {
    my $n = $_[0];
    my $ans = 0;
    for my $i (1..$n) {
        $ans++ if length $i == scalar uniqint split "", $i;
    }
    return $ans;
}

use Test::More tests=>3;
ok si(15) == 14;
ok si(35) == 32;
ok si(1000) == 738;

