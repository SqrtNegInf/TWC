#!/usr/bin/env perl
use v5.36;

# Unbuffered STDOUT
$|++;

@ARGV = (5, 2, 1, 4, 3)
  unless scalar(@ARGV);

die "Please provide minimally three positive integer numbers"
  unless (scalar @ARGV > 2 and
          scalar grep { /^[1-9][0-9]*$/} @ARGV == scalar @ARGV);

my @N = @ARGV;

my $product = 1;
map { $product *= $_ } @N;

my @M = map { $product / $_ } @N;

print "@M\n";
#p @M;
