#!/usr/bin/env perl

use strict;
use warnings;
use experimental 'signatures';

srand 1;

sixoffortynine();

use List::Util qw(shuffle);

sub sixoffortynine {
  my @candidates = (1..49);
  @candidates = shuffle @candidates;
  splice @candidates, 6;
  @candidates = sort {$a <=> $b} @candidates;
  print join(', ', @candidates), "\n";
}
