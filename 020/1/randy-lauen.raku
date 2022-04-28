#!/usr/bin/env raku

sub MAIN( Str $text = 'bookkeeper') {
    say $text.comb(/(.) {} $0*/).join(',');
}
