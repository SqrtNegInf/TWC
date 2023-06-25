#!/usr/bin/env perl
use v5.36.0;

use Test::More;
use List::Util qw(sum0);

my @TESTS = ([5,7],[10,42],[15,176],[20,627],[25,1958],[30,5604],[35,14883],[40,37338],[45,89134],[50,204226]);
my %cache;

(%cache=()), is( piles(   $_->[0]), $_->[1] ) for @TESTS;
(%cache=()), is( piles_0( $_->[0]), $_->[1] ) for @TESTS;
(%cache=()), is( piles_2( $_->[0]), $_->[1] ) for @TESTS;
(%cache=()), is( piles_q( $_->[0]), $_->[1] ) for @TESTS;
done_testing();

sub piles {
  my($count,$n,$m)=(0,@_);
  return 1 unless $n;
  $m//=$n;
  return $cache{"$n,$m"} if exists $cache{"$n,$m"};
  $count += piles($n-$_,$_) for 1 .. ($m>$n?$n:$m);
  $cache{"$n,$m"}||=$count;
}

sub piles_0 {
  return 1 unless $_[0];
  $_[1]//=$_[0];
  $cache{"@_"}//= sum0 map { piles_0( $_[0]-$_,$_ ) } 1 .. ($_[0]>$_[1]?$_[1]:$_[0]);
}

sub piles_2 {
  my($count,$n,$m)=(0,@_);
  return 1 unless $n;
  $m//=$n;
  $cache{"$n,$m"}//= sum_piles_2( $n, $m );
}

sub sum_piles_2 {
  my $count = 0;
  $count += piles_2($_[0]-$_,$_) for 1 .. ($_[1]>$_[0]?$_[0]:$_[1]);
  $count;
}

sub piles_q {
  my($count,$n,@q,$v)=(0,$_[0],[1,$_[0]]);
  while($v = shift @q) {
    $count++ if $v->[1]>=$v->[0];
    push @q, map { [$_,$v->[1]-$_] } $v->[0]..$v->[1]-1;
  }
  $count;
}
