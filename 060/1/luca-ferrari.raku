#!/usr/bin/env raku


sub MAIN( $what = 28 ) {
    my @letters = 'A' .. 'Z';
    my @column-name;


    # numeric value to be converted into a letter
    if $what ~~ Int && $what > 0 && $what <= 16_384 {
        my $column = $what.Int;


        while ( $column > @letters.elems ) {
            @column-name.push: @letters[ $column / @letters.elems  - 1 ];
            $column = $column % @letters.elems;
        }

        @column-name.push: @letters[ $column - 1 ];
        say "Cell $what is { @column-name.join }";
    }
    elsif $what ~~ Str {
        my $column;
        my $multiplier = 0;
        # string, try to find the cell number
        for $what.comb.reverse -> $current_letter {
            $column += @letters.first( $current_letter, :k ) + 1 + ( @letters.elems - 1 ) * $multiplier++;
        }

        say "Cell $what is $column";
    }





}
