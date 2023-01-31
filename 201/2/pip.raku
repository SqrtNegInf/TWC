#!/usr/bin/env raku

use v6; 
#my $d8VS='N1PLGHuD';
my @nszs=({}, {'1'=>1}); # made global to preserve for multiple calls
sub PPil {my $numb=@_.shift;my $pilz=0;
  for   @nszs.elems..$numb       -> $size { # fill NumberSiZeS array of hashes up to desired $numb
    for @nszs[$size-1].keys.sort -> $pway { # loop through all previous size pile-ways
      @nszs[$size]{"1,$pway"}=1;my @prvp=$pway.split(','); # prepend new 1 penny to current size
      for 0..@prvp.elems-1 ->  $pndx { # distribute new size layer's 1 over all the piles of the old ways
        @prvp[$pndx-1]--   if ($pndx);
        @prvp[$pndx  ]++;
        @nszs[$size]{@prvp.sort.join(',')}=1; } }
  };    @nszs[$numb ].keys.sort.join("\n").say;
  $pilz=@nszs[$numb ].keys.elems;
  say "$numb => $pilz;";
  return        $pilz  ;
}
if    (@*ARGS) {
  PPil(@*ARGS);if (@*ARGS[0] >= 32) {my $nowi = now;say "now-INIT:" ~ $nowi - INIT now;} # 32=>9630 takes over 3 seconds to run on my machine
} else { # 1,2,3=>1,2,3; 4=>5,  5=>7  ,6=>11, 7 => 15, 8 => 22, 9 => 30, 10 => 42;
  PPil( 5); # =>    7;
  PPil($_) for 1..10 ;
}
