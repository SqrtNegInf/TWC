#!/usr/bin/env raku

sub MAIN ( @zatrix = ('1001', '1111', '1011', '1111') ) {
    ## as by challenge definition we only use 1s and 0s,
    ## concatenate individual rows into strings
    ## example: 101 111 111 001
    my @matrix = @zatrix.map({.comb.Array});       ## comb makes Seq not a list
    my $rows = @matrix.elems;
    my $cols = @matrix[0].elems;
    print_matrix(@matrix,  "Input:");

    ## 0s are considered 'opaque' -- a single 0 occludes the entire
    ## row or column We pass once through the matrix, row by row,
    ## recording the 0 occurence data to two arrays, one for rows, the
    ## other columns
    my @row_zeros;
    my @col_zeros;

    for ^$rows -> $row {
        @row_zeros[$row] ?|= (@matrix[$row].sum != $cols);
        for ^$cols -> $col {
            @col_zeros[$col] ?|= ! @matrix[$row][$col].Int;
        }
    }

    ## report midway through
    say "Zero Occlusions:";
    say "   cols: ",  @col_zeros;
    say "   rows: ",  @row_zeros, "\n";

    ## now we can pass through the matrix again, transferring the
    ## occurence data back to the rows and columns, zeroing them out
    ## as specified
    for ^$rows -> $row {
        next if @row_zeros[$row] and @matrix[$row] = (0) xx $cols;
        for ^$cols -> $col {
            @matrix[$row][$col] = (! @col_zeros[$col]).Int;
        }
    }

    print_matrix(@matrix,  "Output:");

}

sub print_matrix ( @matrix, $heading? ) {
    $heading.say if $heading;
    ("\t" ~ $_.join(' ')).say for @matrix;
    "".say;
}
