#!/usr/bin/env perl
use v5.30.0;

use strict;
use warnings;

use List::Util qw/zip/;

sub mm {
    my @arr = @_;
    my @brr = sort {$a <=> $b} @arr;
    my $ans = grep {$_ == 1} map {$_->[0] == $_->[1]} zip [@arr], [@brr];
    return $ans;
}


use Test::More tests=>3;
ok mm(1, 1, 4, 2, 1, 3) == 3;
ok mm(5, 1, 2, 3, 4) == 0;
ok mm(1, 2, 3, 4, 5) == 5;


