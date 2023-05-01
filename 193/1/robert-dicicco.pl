#!/usr/bin/env perl
use v5.36;
use boolean;

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
