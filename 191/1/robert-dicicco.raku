#!/usr/bin/env raku

my @arr = ([1,2,3,4],[1,2,0,5],[2,6,3,1],[4,5,2,3]);

for (@arr) -> @lst {

  my $result = "good";

  print("Input: @list = (" ~ @lst ~ ")\n");

  my $max = @lst.max;

  my @sorted = @lst.sort;

  my $x = 0;

  while ($x < @lst.elems - 1) {

    if ( (2 * (@sorted[$x]) > $max)) {

      say "Output: -1\n";

      $result = "bad";

      last;

    }

    $x++;

  }

  if ($result eq "good") { say "Output: 1\n"}

}
