#!/usr/bin/env raku

use Math::Combinatorics <partitions>;

sub MAIN( Int $n where { $n > 0 } = 5 ) {
    say partitions( $n ).elems;
}
