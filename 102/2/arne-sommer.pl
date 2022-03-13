#!/usr/bin/env perl

use strict;
use feature 'say';

my $N = 120;

die '$N is not a positive integer' unless $N =~ /^[1-9][0-9]*$/;

my $position = $N;
my $string   = "";

while ($position > 1)
{
  my $prefix = $position . '#';

  $string = $prefix . $string;
  $position -= length($prefix);
}

length($string) == $N
    ? say $string
    : say "#$string";
