#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $upper = 3;

GetOptions("upper=i" => \$upper);

die "--upper must be > 0" if $upper < 1;

my $S = $ARGV[0] // 4;

recurse($S);

sub recurse ($left, @points)
{
  $left == 0 && ( say join(" ", @points) ) && return;

  for my $step (1 .. $upper)
  {
    recurse($left - $step, @points, $step) if $left >= $step;
  }
}
