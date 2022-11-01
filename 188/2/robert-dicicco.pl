#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/say/;

my @given = ([5,4], [4,6], [2,5], [3,1], [7,4]);
my $step;

sub steps {
  my $x = shift;
  my $y = shift;
  if ($x > $y) {
    $x = $x - $y;
  } elsif ($y > $x ) {
    $y = $y - $x;
  }
  $step++;
  if ( $x == $y) {
    $step++;
     say "Output: $step\n";;
    return;
   }
  steps($x,$y);
}

sub main {
  foreach my $g (@given) {
    my $x = @$g[0];
    my $y = @$g[1];
    print("Input: \$x = $x,  \$y = $y\n");
    $step = 0;
    steps($x,$y);
  }
}

main();
