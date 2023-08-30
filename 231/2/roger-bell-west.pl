#!/usr/bin/env perl

use strict;
use warnings;
use experimental 'signatures';

use Test::More tests => 2;

is(seniorcitizens(['7868190130M7522', '5303914400F9211', '9273338290F4010']), 2, 'example 1');
is(seniorcitizens(['1313579440F2036', '2921522980M5644']), 0, 'example 2');

sub seniorcitizens($a) {
  my $p = 0;
  foreach my $n (@{$a}) {
    my $c = substr($n, 11, 1);
    if ($c ge '6') {
      $p++;
    }
  }
  return $p;
}
