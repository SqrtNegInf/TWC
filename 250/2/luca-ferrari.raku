#!/usr/bin/env raku

sub MAIN( @words = ('perl', 'r4ku') ) {
    @words.map( { $_ ~~ / ^ <[0..9]>+ $ / ?? $_.Int !! $_.chars } ).max.say;
}
