#!/usr/bin/env raku

for 'bookkeeper' -> $in {
  say join(' ',splitchange($in));
}

sub splitchange ($in) {
   return map {$_.Str}, $in ~~ m:g/(.) {} :my $c = $0; ($c*)/;
}
