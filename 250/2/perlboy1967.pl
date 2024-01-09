#!/usr/bin/env perl
use v5.36;
no warnings;

use Test::More;

use List::Util qw(max);

sub alphanumericStringValue (@strings) {
  0 + max map { /^\d+$/ ? $_ : length $_ } @_;
}

is(alphanumericStringValue(qw(perl 2 000 python r4ku)),6);
is(alphanumericStringValue(qw(001 1 000 0001)),1);

done_testing;
