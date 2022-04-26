#!/usr/bin/env raku

my $depth = 1; my @seq = (5, 9, 2, 8, 1, 6);

for (1..$depth) {
  my @o=map {@seq[$_+1]-@seq[$_]}, (0..@seq.end-1);
  @seq=@o;
}

say join(' ',@seq);
