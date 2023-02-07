#!/usr/bin/env raku

my @numbers = (7,8,7,7,7);
my $len = @numbers.elems ;
my $result = 0 ;
for (0..$len - 3 ) -> $i {
  if @numbers[$i .. $i + 2].grep( { $_ % 2 == 1 }).elems == 3 {
      $result = 1 ;
      last ;
  }
}
say $result ;
