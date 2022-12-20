#!/usr/bin/env perl

use strict;
use warnings;
use experimental 'signatures';

use Test::More tests => 3;

is(specialintegers(15), 14, 'example 1');
is(specialintegers(35), 32, 'example 2');
is(specialintegers(1000), 738, 'example 3');

use List::Util qw(max);

sub specialintegers($n) {
    my $o = 0;
    foreach my $i (1..$n) {
        my %f;
        foreach my $c (split('', $i)) {
            $f{$c}++;
        }
        if (max(values %f) == 1) {
            $o++;
        }
    }
    return $o;
}
