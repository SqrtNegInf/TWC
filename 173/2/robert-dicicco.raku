#!/usr/bin/env raku

my @arr = [2];
my $count = 1;

say @arr[0];

loop {

  my $sum = ([*] @arr ) + 1;

  @arr.push($sum);

  say $sum;

  $count++;

  last if $count == 10;

}
