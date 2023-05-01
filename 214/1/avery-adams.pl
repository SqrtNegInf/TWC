#!/usr/bin/env perl

use strict;
use v5.24;

my @A = (2,5,2,1,7,5,1);
my @sorted = reverse sort @A;
my %hash;
my @table = ('G', 'S', 'B');
my $curr;

foreach (@sorted) {
    if ($curr <= 2) {
        $hash{$_} //= $table[$curr];
    } else {
        $hash{$_} //= $curr + 1;
    }
    $curr++;
}

say $hash{$_} for @A;
