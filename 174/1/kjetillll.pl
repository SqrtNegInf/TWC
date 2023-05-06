#!/usr/bin/env perl
use v5.36;
use List::Util 'sum';

my $want = 18;
my $n = 0;

while( $want > 0 ) {

    my @d = split //, $n;       #array d gets digits

    say $n and $want-- if $n == sum( map $d[$_-1]**$_, 1..@d);

    $n++;

}
