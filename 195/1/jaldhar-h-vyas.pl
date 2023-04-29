#!/usr/bin/env perl
use v5.36;

sub unique {
    my @arr = @{ $_[0] };
  my %seen;
  return grep { !$seen{join q{}, $_}++ } @arr;
}

my $n = 1000;

say scalar grep { my @digits = split //, $_; scalar @digits == scalar unique(\@digits); } 1 .. $n;
