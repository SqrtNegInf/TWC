#!/usr/bin/env raku

my $target=12;

for (0..$target) -> $a {
  for ($a..$target) -> $b {
    my $c=$target-$a-$b;
    if ($c>=$b) {
      say "$a $b $c";
    }
  }
}
