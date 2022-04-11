#!/usr/bin/env raku

#| Print all the colourful 3 digit numbers
sub MAIN() {
    .say for (111..999).grep( &is-colourful );
}

sub is-colourful( Int $number ) {
    my @vals = $number.comb;
    [!==] (|@vals, @vals[0] * @vals[1], @vals[1] * @vals[2], @vals[0] * @vals[1] * @vals[2]).sort;

}
