#!/usr/bin/env perl

use strict;
use warnings;
use boolean;
use feature qw/say/;

my @arr = (2,3,4);

for my $n (@arr) {

  say "Input: \$n = $n";

  my $x = 0;

  print "Output: ";

  while ( true ) {

    my $str = sprintf ("%0*b", $n,$x);

    if(length($str) > $n) {

      last;

    }

    print "$str ";

    $x++;

  }

  say "\n";

}
