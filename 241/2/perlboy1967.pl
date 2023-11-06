#!/usr/bin/env perl

use v5.32;

use common::sense;

use Math::Prime::Util qw(factor);

use Test2::V0 -srand => 1;

sub _cmpLists (\@\@) {
  my $r = 0;

  for (1 .. $_[0]->$#*) {
    $r = $_[0]->[$_] <=> $_[1]->[$_];
    return $r if $r != 0;
  }

  return 0;
}

sub primeOrder (@) {
  map { $_->[0] } sort { 
    scalar(@$a) <=> scalar(@$b)
                || 
            _cmpLists(@{$a},@{$b}) 
  } map { [$_, factor($_)] } @_;

}

is([primeOrder(11,8,27,4)],[11,4,8,27]);
is([primeOrder(15,3,4,2,12)],[2,3,4,15,12]);

done_testing;
