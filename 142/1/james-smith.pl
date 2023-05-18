#!/usr/bin/env perl
use v5.36;

use Test::More;

my @TESTS = (
  [ 24, 2, 2 ],
  [ 30, 5, 2 ],
  [ 121, 1, 2 ],
  [ 231, 1, 3 ],
  [ 242, 1 , 3 ],
);

is( divisor_last_digit($_->[0],$_->[1]), $_->[2] ) foreach @TESTS;

done_testing();

sub divisor_last_digit {
  my($m,$n)=@_;
  ($n==1?1:0)+grep{$_%10==$n}
              map{$m%$_?():$m==$_*$_?($_):($_,$m/$_)}
              2..sqrt$m;
}
