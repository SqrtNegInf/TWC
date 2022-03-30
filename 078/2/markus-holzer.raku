#!/usr/bin/env raku
my @A = 10, 20, 30, 40, 50;
my @B = 3, 13, -2, 0, 5;

say "Builtin";
say @A.rotate($_).join: ' ' for @B;

say "Selfmade (multi)";
say join ' ',rotate-array-multi( @A, $_ ) for @B;

say "Selfmade (concise)";
say join ' ', rotate-array-concise( @A, $_ ) for @B;

say "In-Place";
for @B {
    my @a = @A.clone;
    say  join(' '), rotate-array-inplace( @a, $_ );
}

multi rotate-array-multi( @a, $i where $i < 0 ) {
    rotate-array-multi( @a, @a + $i ) }

multi rotate-array-multi( @a, $i where $i >= @a ) {
    rotate-array-multi( @a, $i % @a ) }

multi rotate-array-multi( @a, $i ) {
    [ |@a[ $i..* ], |@a[ ^$i ] ] }

sub rotate-array-concise( @a, $i ) {
    ( @a + $i ) % @a andthen [ |@a[ $_..* ], |@a[ ^$_ ] ] }

sub rotate-array-inplace( @a, $i ) {
    @a.splice( 0, 0, @a.splice( ( @a + $i ) % @a, *, [] ) );
    @a }
