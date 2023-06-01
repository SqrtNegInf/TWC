#!/usr/bin/env perl
use v5.36;

# Unbuffered STDOUT
$|++;

use Scalar::Util qw(looks_like_number);
use POSIX qw(floor);
use Bit::Vector;

use Data::Printer;

my ($N) = (4);  # hmmmm

die "Please provide a integer number bigger than 2"
  unless (looks_like_number($N) and $N > 2 and $N == int($N));

my $bits = floor(log(2)/log($N));
my $vecGcd = Bit::Vector->new($bits);
my $vecA = Bit::Vector->new($bits);
my $vecB = Bit::Vector->new($bits);

my @G;
for my $i (1 .. $N - 1) {
  $vecA->from_Dec($i);
  for my $j ($i + 1 .. $N) {
    $vecB->from_Dec($j);
    $vecGcd->GCD($vecA, $vecB);
    push(@G, [$i,$j]) 
      if ($vecGcd->to_Dec() < $N);
  }
}

printf "Input: %d\n", $N;
printf "Output: %d\n\t%s\n", scalar(@G), join("\n\t", map {"gcd($_->[0],$_->[1])"} @G);
