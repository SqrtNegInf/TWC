#!/usr/bin/env perl

use strict;

use warnings;
use feature qw(say);
use Test::More;
use Benchmark qw(cmpthese timethis);
use Inline 'C';

my @TESTS = (  [5,2],[4,3],[6,1] );

is( binary_flip( $_->[0] ), $_->[1] ) for @TESTS;
is( string_flip( $_->[0] ), $_->[1] ) for @TESTS;
is( c_flip(      $_->[0] ), $_->[1] ) for @TESTS;
is( c2_flip(     $_->[0] ), $_->[1] ) for @TESTS;
done_testing();

sub string_flip {
  $_[0] ? oct '0b'.sprintf('%b',$_[0])=~tr/01/10/r : 0
}

sub binary_flip {
  my($r,$k,$n) = (0,1,shift);
  $r|=(~$n&1)<<$k++, $n>>=1 while $n;
  $r
}

__END__
__C__
int c_flip(int n) {
  int r=0;
  int k=0;
  while(n) {
    r|=(1^n&1)<<k++;
    n>>=1;
  }
  return r;
}

int c2_flip(int n) {
  int o = n;
  int m = 0;
  while(o) {
    m<<=1;
    m++;
    o>>=1;
  }
  return n^m;
}
