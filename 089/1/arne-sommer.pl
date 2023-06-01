#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics 'combinations';
use List::MoreUtils 'duplicates';
use Getopt::Long;

my $verbose = 0;
GetOptions("verbose"  => \$verbose);

my $N = $ARGV[0] // 100;

die "Please specify an integer > 0" unless $N =~ /^[1-9]\d*$/;

my @all = (1 .. $N);

my $sum = 0;

for my $pair (combinations(\@all, 2))
{
  $sum += gcd(@$pair);
}

say $sum;

sub gcd ($a, $b)
{
  my @a = divisors($a);
  my @b = divisors($b);
  my @common = duplicates(@a, @b);
  my $gcd    = $common[$#common];

  say ":: GCD($a, $b) -> $gcd" if $verbose;
  
  return $gcd;
}

sub divisors ($number)
{
  my @divisors = (1);
  
  for my $candidate (2 .. $number/2)
  {
    push(@divisors, $candidate) if $number % $candidate == 0;
  }
  
  push(@divisors, $number);
  
  return @divisors;
}
