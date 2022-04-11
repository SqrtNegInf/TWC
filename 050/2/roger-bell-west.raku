#!/usr/bin/env raku

my @l=(19,11,9,7,20,3,17,16,2,14,1);

print join(' ',noble(@l)),"\n";

sub noble(@li) {
  my @l=sort @li;
  my @r;
  for (0..@l.end) -> $m {
    if (@l[$m] == @l.end-$m) {
      push @r,@l[$m];
    }
  }
  return @r;
}
