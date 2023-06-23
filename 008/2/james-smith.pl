#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);

sub center {
  my $ml = max map { length $_ } @_;
  say ' ' x (($ml-length$_)/2), $_ foreach @_;
}

center( "This", "is", "a test of the", "center function");
