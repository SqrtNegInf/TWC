#!/usr/bin/env raku

my @arr = (
            [1,4,2,3,5],
            [9,0,6,2,3,8,5]
          );

my @nums = 3,4;

my $count = 0;

while $count < 2 {

  my @results = ();

  my $val = @arr[$count];

  print("\nInput: \@n = \(@$$val\) and \$i = @nums[$count]\n");

  for (@$$val) {

    push(@results, $_) if ($_ >= @nums[$count]);

  }

  print("Output: \(",@results,"\)\n");

  $count++;

}
