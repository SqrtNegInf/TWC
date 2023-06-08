#!/usr/bin/env perl
use v5.36;


my $N     = 2;
my $S     = 10;

die "Illegal 'N' value" if int($N) ne $N && $N <= 1;
die "Illegal 'S' value" if int($S) ne $S && $S <= 1;

my $start = 10 ** ($N - 1);
my $stop  = (10 ** $N) -1;
my @all   = ($start .. $stop);
my @some  = grep { get_sum($_) == $S } @all;

say join(", ", @some);

sub get_sum
{
  my $integer = shift;
  my $sum = 0;
  for my $digit (split(//, $integer))
  {
    $sum += $digit;
  }
  return $sum;
}
