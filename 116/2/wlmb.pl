#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0);
use POSIX qw(round);

foreach(<33 34 35 50 51> ) {
    my $x=sqrt(sum0 map {$_**2} split '',$_);
    say "Input: $_\nOutput: ", $x==round($x)?1:0;
}
