#!/usr/bin/env raku

sub MAIN (@args = (0, 1, 3, 5, 9, 10) ) { .put for missing-numbers(@args) }

sub missing-numbers (@array) {
   my $present = @array».Str.Set;
   return [(0 .. @array.elems).grep({ $_.Str ∉ $present })];
}
