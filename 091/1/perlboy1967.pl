#!/usr/bin/env perl
use v5.36;

# Unbuffered STDOUT
$|++;

use Scalar::Util qw(looks_like_number);

my $N = 1122234;
my $M;

die "Please provide a positive integer number"
  unless (looks_like_number($N) and $N > 0 and $N == int($N));

while ($N =~ m#((\d)\2*)#g) {
  $M .= sprintf('%d%s', length($1), $2);
}

printf "Input: %d\n", $N;
printf "Output: %d\n", $M;
