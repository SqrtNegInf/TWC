#!/usr/bin/env perl
use v5.32;
use feature qw(signatures);

#use common::sense;

use Test2::V0 -srand => 1;

use List::Util qw(max);
use List::MoreUtils qw(frequency);

sub almostFrequentWord ($p,$ban) {
  my %f = frequency grep !/$ban/, split /\W+/, $p;
  my %w; push(@{$w{$f{$_}}},$_) for (keys %f);
  $w{max(keys %w)};
}

is(almostFrequentWord('five dot three dot three','dot'),['three']);
is(almostFrequentWord('one plus one plus one equals three','one'),['plus']);

done_testing;

