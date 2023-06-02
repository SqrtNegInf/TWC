#!/usr/bin/env perl
use v5.36;

use POSIX qw/:limits_h/;
use Config;

sub task1 {
  my $N = shift;
  my $s = reverse $N;
  $s =~ s/(.*)-$/-$1/;
  if ($s > INT_MAX || $s < INT_MIN) {
    say 0;
  } else {
    say $s;
  }
}

task1 4321;
task1 -1234;
task1 "1231230512";
task1 -1700;
