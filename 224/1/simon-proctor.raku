#!/usr/bin/env raku

sub MAIN( Str $source = "scriptinglanguage", Str $target = "perl" ) {
    ($target.comb.Bag (<=) $source.comb.Bag).lc.say;
}
