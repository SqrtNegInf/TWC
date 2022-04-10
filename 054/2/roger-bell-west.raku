#!/usr/bin/env raku

my $n=23;
  my @k=($n);
  while ($n != 1) {
    if ($n % 2 == 0) {
      $n/=2;
    } else {
      $n*=3;
      $n++;
    }
    push @k,$n;
  }
  say join(', ',@k);
#}
