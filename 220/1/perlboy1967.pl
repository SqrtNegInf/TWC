#!/usr/bin/env perl
use v5.36;

use common::sense;

use Test::More;
use Test::Deep qw(cmp_deeply);

use List::MoreUtils qw(uniq);

sub commonChars (@) {
  my %c;
  map { $c{$_}++ } uniq split //,lc for (@_);
  sort grep { $c{$_} == scalar @_ } keys %c;
}

cmp_deeply([commonChars(qw(Perl Rust Raku))],[qw(r)]);
cmp_deeply([commonChars(qw(love live leave))],[qw(e l v)]);
cmp_deeply([commonChars(qw(bamboo bank))],[qw(a b)]);

done_testing;
