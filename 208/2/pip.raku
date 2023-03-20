#!/usr/bin/env raku

sub DpaM {my @nums = sort +*, @_;my @dpam = ();my %hasn = ();
  for (0..(@nums.elems-2)) {
    if (@nums[$_] == @nums[$_+1]) {
      push(@dpam,    @nums[$_  ]); last;
    }
  }
  for (0..(@nums.elems-1)) {%hasn{@nums[$_]} = 1; }
  for (0..(@nums.elems-1)) {
    if  (  @dpam && !(%hasn{$_+1}:exists)) {
      push(@dpam,           $_+1); last;
    }
  }
  printf(                "(%-7s) => ", join(',', @nums));
  if    (@dpam) { printf("(%s);\n",    join(',', @dpam)); }
  else          { say      "-1;"; }
  return(@dpam);
}
if    (@*ARGS) {
  DpaM(@*ARGS);
} else {
  DpaM(1,2,2,4); # => (2,3);
  DpaM(1,2,3,4); # => -1   ;
  DpaM(1,2,3,3); # => (3,4);
}
