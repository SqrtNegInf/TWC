#!/usr/bin/env raku

my @arr = ();                             # result array

sub MAIN( Int $m = 38, Int $n = 2) {              # $n = number to test, $n = how many factors to sum
  for 1..$m -> $p {
    if ($p.is-prime) { @arr.push: $p }
  }

  for @arr.combinations($n) {             # for each combination of size $n
    if $_.sum == $m {                     # print if sum = $m
      say $_;
    }
  }
}
