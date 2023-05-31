#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $N = 3;
my $verbose = 0;

#GetOptions("N=i"      => \$N,
#           "verbose"  => \$verbose);

my @N = <1 2 3 4>;

my $end = @N -1;

my $delta = int(0.5 + $end/2);
my $try   = $delta;

while (1)
{
  say ": try at $try" if $verbose;

  if ($try == 0 && $N < $N[0])
  {
    say 0;
    last;
  }
  elsif ($try == $end && $N > $N[$end])
  {
    say $end +1;
    last;
  }
  
  if ($N[$try] == $N)
  {
    say $try;
    last;
  }
  elsif ($N[$try] < $N && $N[$try+1] > $N)
  {
    say ++$try;
    last;
  }

  $delta = int(0.5 + $delta/2);

  if ($N[$try] < $N)
  {
    $try += $delta;
  }
  elsif ($N[$try] > $N)
  {
    $try -= $delta;
  }
}
