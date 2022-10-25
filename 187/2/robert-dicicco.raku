#!/usr/bin/env raku

my @arr = [<1 2 3 2>,<1 3 2>,<1 1 2 3>,<2 4 3>];

my $val = 0;
my $a;
my $b;
my $c;

for (@arr) -> $ref {
  my $maxval = 0;
  my $val = 0;
  print("Input: \@n = \[" ~ @($ref) ~ "\]\n");
  for @($ref).permutations -> $f {
    $val = substr(Int($f.join),0..2);
    if ($val > $maxval) {
      $maxval = $val;
    }
  }
  ($a,$b,$c) = $maxval.comb;
  if (($a+$b > $c) & ($b+$c > $a) & ($a+$c > $b)) {
    print("Output: \[$a, $b, $c\]\n");
  } else {
    print("Output: \[\]\n");
  }
  say " ";
}
