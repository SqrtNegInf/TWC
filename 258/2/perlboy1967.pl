#!/usr/bin/env perl
use v5.32;
use feature qw(signatures);

#use common::sense;

use Test2::V0 -srand => 1;

use List::Util qw(sum0);

sub sumOfValues ($k,@ints) {
  sum0 map { $ints[$_] } grep {
    my $b = sprintf('%b',$_);
    length($b =~ s#0##gr) == $k;
  } (0 .. $#ints);
}

is(sumOfValues(1,2,5,9,11,3),17);
is(sumOfValues(2,2,5,9,11,3),11);
is(sumOfValues(0,2,5,9,11,3),2);

done_testing;
