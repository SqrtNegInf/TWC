#!/usr/bin/env perl
use v5.16;

use common::sense;

use Test::More;

use List::MoreUtils qw(uniq);
use Algorithm::Combinatorics qw(combinations);

sub similarWords (@) {
  my $n = 0;
  my %w;

  # Find and group 'similar' words
  push(@{$w{join '',uniq sort split (//,$_)}},$_) for (@_);

  # Do the counting of number of pairs
  for (grep { @{$w{$_}} > 1 } keys %w) {
    my @c = combinations($w{$_},2);
    $n += scalar @c;
  }

  return $n;
}

is(similarWords("aba", "aabb", "abcd", "bac", "aabc"),2);
is(similarWords("aabb", "ab", "ba"),3);
is(similarWords("nba", "cba", "dba"),0);

done_testing;
