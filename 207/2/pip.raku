#!/usr/bin/env raku

sub HNdx {my @ctnz = sort -*, @_;my $hndx = 0;
  while ($hndx < @ctnz.elems && @ctnz[$hndx] > $hndx) { $hndx++; }
  printf("(%-10s) => %d;\n", join(',', @ctnz), $hndx);
  return($hndx);
}
if    (@*ARGS) {
  HNdx(@*ARGS);
} else {
  HNdx(10,8,5,4,3); # => 4;
  HNdx(25,8,5,3,3); # => 3;
}
