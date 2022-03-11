#!/usr/bin/env raku

my $ml=0;
my @r;
for ('words'.IO.lines) {
  my $l=chars($_);
  if ($l >= $ml) {
    if ($_.comb.sort.join('') eq $_) {
      if ($l > $ml) {
        @r=();
        $ml=$l;
      }
      push @r,$_;
    }
  }
}

say $_ for @r;
