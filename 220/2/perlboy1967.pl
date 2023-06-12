#!/usr/bin/env perl
use v5.16;

use common::sense;

use Test::More;
use Test::Deep qw(cmp_deeply);

use List::MoreUtils qw(uniq slide all);
use Algorithm::Combinatorics qw(permutations);

sub _areSquareful ($$) {
  my $s = $_[0] + $_[1];
  state $c = {};
  $c->{$s} //= int($s**0.5) == $s**0.5;
  return $c->{$s};
}

sub squareful (\@) {
  my ($ar,$u,@r) = ($_[0],uniq(@{$_[0]}) == 1);

  my $iter = permutations($ar);
  while (my $arC = $iter->next) {
    push(@r,$arC) if all {$_} slide {_areSquareful($a,$b)} @$arC;
    last if (scalar @r && $u);
  }

  return @r;
}

cmp_deeply([squareful(@{[1,17,8]})],[[1,8,17],[17,8,1]]);
cmp_deeply([squareful(@{[2,2,2]})],[[2,2,2]]);

done_testing;
