#!/usr/bin/env perl
use v5.36;

#use common::sense;

use Test2::V0 -srand => 1;

use List::Util qw(uniq max);
use Algorithm::Combinatorics qw(variations);

sub mostFrequentLetterPair($string) {
  my @chars = uniq sort split //, $string;
  my $l = length $string;

  my %count;

  for my $p (variations(\@chars,2)) {
    next if $$p[0] eq $$p[1];
    my $c2 = $$p[0].$$p[1];
    $count{$c2} = ($l - length ($string =~ s/$c2//gr))/2;
  }

  my $m = max(values %count);

  return (sort grep { $count{$_} == $m } keys %count)[0];
}

is(mostFrequentLetterPair('abcdbca'),'bc');
is(mostFrequentLetterPair('cdeabeabfcdfabgcd'),'ab');

done_testing;
