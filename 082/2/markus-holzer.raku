#!/usr/bin/env raku
unit sub MAIN(Str $A = 'XXY', Str $B = 'XXZ', Str $C = 'XXXXZY');

sub interleavable( Str $a, Str $b, Str $c ) {
    so grep { $c eq [~] $a.substr( 0, $^i ), $b, $a.substr( $^i ) }, ^$a.chars }

say +( interleavable( $A, $B, $C ) || interleavable( $B, $A, $C ) )
