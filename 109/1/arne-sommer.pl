#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';

my $limit = $ARGV[0] // 20;
my @chowla;

for my $index (1 .. $limit)
{
  my @divisors = divisors($index, 1, 1);

  push(@chowla, (sum(@divisors) // 0));
}

say join(", ", @chowla);


sub divisors ($number, $not_self, $not_one)
{
  my @divisors;
  
  for my $candidate ( ($not_one ? 2 : 1) .. $number/2)
  {
    push(@divisors, $candidate) unless $number % $candidate;
  }
  
  push(@divisors, $number) unless $not_self;
  
  return @divisors;
}
