#!/usr/bin/env raku

sub MAIN (@args = [10,8,5,4,3] ) { put h-index(@args) }

sub h-index (@citations) {
   @citations = @citations».Int.grep({.so}).sort.reverse;
   $_ < @citations[$_] || return $_ for ^@citations;
   return @citations.elems;
}
