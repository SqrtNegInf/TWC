#!/usr/bin/env raku

use Test;

is False, twice-largest <1 2 3 4>;
is True,  twice-largest <1 2 0 5>;
is True,  twice-largest <2 6 3 1>;
is False, twice-largest <4 5 2 3>;

done-testing;

sub twice-largest(@list) {
  my @li = @list».Int.sort(-*);
  @li[0] ≥ 2 × @li[1]
}


