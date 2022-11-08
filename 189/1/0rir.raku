#!/usr/bin/env raku

use Test;

sub next-gt( Str $ch, List $char ) {
    my $r = (@$char.grep( * gt $ch )).min( :by( &infix:<~~> ));
    $r ~~ ∞ ?? $ch !! $r;
}

my @Test =
    { array => qw/e m u g/, target => 'b', exp => 'e',},
    { array => qw/d c e f/, target => 'a', exp => 'c',},
    { array => qw/j a r/,   target => 'o', exp => 'r',},
    { array => qw/d c a f/, target => 'a', exp => 'c',},
    { array => qw/t g a l/, target => 'v', exp => 'v',},
    { array => qw//, target => 'v', exp => 'v',},
    ;

    plan +@Test;
    for @Test -> %t {
        is next-gt( %t<target>, @(%t<array>)), %t<exp>,
                "%t<target> @(%t<array>).raku() ->  %t<exp>";
    }
    done-testing;
