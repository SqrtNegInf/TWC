#!/usr/bin/env perl
use v5.36;
use List::Util qw( max );

my @arr = ([1,2,3,4],[1,2,0,5],[2,6,3,1],[4,5,2,3]);

for my $lst (@arr) {

  my $result = "good";

  print("Input: \@list = \(@$lst\)\n");

  my $max = max(@$lst);

  my @sorted = sort @$lst;

  my $x = 0;

 while($x < scalar(@$lst)-1) {

    if ( (2 * ($sorted[$x]) > $max)) {

      say "Output: -1\n";

      $result = "bad";

      last;

    }

    $x++;

  }

  if ($result eq "good") { say "Output: 1\n"}

 }
