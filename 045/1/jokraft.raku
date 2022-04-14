#!/usr/bin/env raku
my Str $str = "The quick brown fox jumps over the lazy dog";
$str = $str.subst(" ","",:g);
my @arr = $str.split("", :skip-empty);
my $out = "";
for (0..7) -> $i {
  my $c = 0;
  while $c * 8 + $i < @arr.elems {
    $out = $out ~ @arr[$i + $c*8];
    $c++;
  }
  $out = $out ~ " ";
}
say $out;
