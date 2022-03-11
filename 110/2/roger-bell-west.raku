#!/usr/bin/env raku

my @a;
my $ri=0;

for 'example.csv'.IO.lines {
  my @r=split ',',$_;
  for 0..@r.elems-1 -> $ci {
    @a[$ci][$ri]=@r[$ci];
  }
  $ri++;
}

for @a -> @r {
  say join(',',@r);
}
