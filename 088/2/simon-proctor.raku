#!/usr/bin/env raku

my %examples = (
    'ex1' => [
        [ 1, 2, 3 ],
        [ 4, 5, 6 ],
        [ 7, 8, 9 ],
    ],
    'ex2' => [
        [  1,  2,  3,  4 ],
        [  5,  6,  7,  8 ],
        [  9, 10, 11, 12 ],
        [ 13, 14, 15, 16 ],
          ],
    'ex3' => [
        [ 1, 2, 3 ],
          ],
    'ex4' => [
        [ 1, 2 ],
        [ 3, 4 ],
    ],
    );

my %*SUB-MAIN-OPTS = :named-anywhere;

#| ex1 or ex2 for the examples
#multi sub MAIN (
#    \k where { %examples{k} } #= ex1 or ex2 for the main examples, ex3, ex4 for simple examples
#) {
    spiralize( %examples{'ex1'} ).join(", ").say;
    spiralize( %examples{'ex2'} ).join(", ").say;
#}


multi sub spiralize( @grid where { @grid.elems == 1 } ) {
    @grid[0]
}

multi sub spiralize( @grid where { @grid.elems == 2 } ) {
    |@grid[0], |@grid[1].reverse
}

multi sub spiralize( @grid ) {
    |@grid[0],
    |((0^..^@grid.end).map( { @grid[$_][*-1] } )),
    |@grid[*-1].reverse,
    |((0^..^@grid.end).reverse.map( { @grid[$_][0] } )),
    |spiralize( center( @grid ) )
}

sub center( @grid ) {
    @grid[0^..^@grid.end].map( -> @a { @a[0^..^@a.end] } );
}
