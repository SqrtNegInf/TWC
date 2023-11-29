#!/usr/bin/env perl
use v5.36;

use common::sense;
use feature 'signatures';

use Test2::V0 -srand => 1;

use List::Util qw(sum0);
use List::MoreUtils qw(frequency);

sub countSmaller(@int) {
  my %f = frequency(@int);

  map {
    my $i = shift @int;
    sum0 map { $f{$_} } grep { $_ < $i } keys %f;
  } 0 .. $#int;

}

is([countSmaller(8,1,2,2,3)],[4,0,1,1,3]);
is([countSmaller(6,5,4,8)],[2,1,0,3]);
is([countSmaller(2,2,2)],[0,0,0]);

done_testing;
