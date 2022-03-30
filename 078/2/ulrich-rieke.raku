#!/usr/bin/env raku

my @A = (10,20,30,40,50); my @B = (3,4);
for @B -> $index {
  say @A.rotate( $index ) ;
}
