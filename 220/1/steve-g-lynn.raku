#!/usr/bin/env raku

sub common_characters( @words ) {
    [(&)] @words.map( {$_.lc.comb.Set} )
}

say &common_characters(('Perl','Rust','Raku')); #Set(r)
say &common_characters(('love','live','leave')); #Set(e l v)
