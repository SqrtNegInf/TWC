#!/usr/bin/env raku


for <55 743> -> $n {
  my $t=$n;
  while (1) {
    if ($t ~~ /^<[01]>+$/) {
      say $t;
      last;
    } else {
      $t+=$n;
    }
  }
}
