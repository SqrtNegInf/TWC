#!/usr/bin/env perl
use v5.36;

use Lingua::EN::Numbers qw/num2en/;

my $limit = int($ARGV[0] || 100);

my @numbers;

for my $candidate (1 .. $limit)
{
  push(@numbers, $candidate) unless num2en($candidate) =~ /e/;
}

say join(", ", @numbers);
