#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $numbers = '2 5 4 4 5 5 2';

my @numbers = split(/\s+/, $numbers);

map { /^[1-9]\d*$/ || die "$_ is not an integer" } @numbers;

my %count;

map { $count{$_}++ } @numbers;

my @odd = grep { $count{$_} % 2 } keys %count;

die "Did not find one (and only one) match. Found: "
      . ( @odd ? join(", ", @odd) : 'none')  if @odd != 1;

say join(", ", @odd);

