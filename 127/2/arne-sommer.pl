#! /usr/bin/env perl
use v5.36;

use Getopt::Long;

my $verbose = 0;

GetOptions("verbose"  => \$verbose);

my $interval = '1,4 3,5 6,8 12,13 3,20';

my @Intervals = split(/\s+|\s+/, $interval);

sub does_intersect($first, $second)
{
  my ($first_from,  $first_to)  = split(",", $first);
  my ($second_from, $second_to) = split(",", $second);

  return 0 if $first_to  < $second_from;
  return 0 if $second_to < $first_from;
  return 1;
}

my @done;
my @conflict;

for my $interval (@Intervals)
{
  say ": Inspecting interval: $interval" if $verbose;
  
  for my $iv (@done)
  {
    if (does_intersect($interval, $iv))
    {
      push(@conflict, $interval);
      last;
    }
  }

  push(@done, $interval);
} 

say '[ ', join(", ", map { "($_)" } @conflict), ' ]';
