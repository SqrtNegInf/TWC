#!/usr/bin/env raku

my @n = [(1,2,3), (2,3,4), (1,2,3,10)];
my $sum = 0;

for ( @n ) -> @arr {
  for @arr.combinations: 2 -> @x {
    $sum += @x[0] +& @x[1];
  }

  print "(" ~ @arr ~ ") = $sum\n";
  $sum = 0;
}
