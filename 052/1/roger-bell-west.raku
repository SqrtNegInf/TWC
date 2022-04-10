#!/usr/bin/env raku

my @a=111,999;

for min(@*ARGS)..max(@*ARGS) -> $c {
  my @d=$c.comb(/./);
  my $v=1;
  for 0..@d.end-1 -> $i {
    if (@d[$i]+1 != @d[$i+1]) {
      $v=0;
      last;
    }
  }
  if ($v) {
    say $c;
  }
}
