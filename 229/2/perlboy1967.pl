#!/usr/bin/env perl

use v5.16;

use common::sense;

use Test::More;
use Test::Deep;

use List::Util qw(uniq);

sub twoOutOfThree (\@\@\@) {
  my (@n,%n);

  push(@n,{map { $n{$_}++; ($_,1) } @$_}) for @_;

  return grep {
    my $n = $_; 
    scalar(grep{exists $_->{$n} } @n) >= 2;
  } sort { $a <=> $b } uniq(keys %n);
}

cmp_deeply([twoOutOfThree(@{[1,1,2,4]},@{[2,4]},@{[4]})],[2,4]);
cmp_deeply([twoOutOfThree(@{[4,1]},@{[2,4]},@{[1,2]})],[1,2,4]);

done_testing;
