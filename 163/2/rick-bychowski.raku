#!/usr/bin/env raku

sub MAIN( $a = 1, $b = 5, @c = (4,3,2,6,7) ) {
    my @a = ( $a, $b, @c).flat;
    summation( @a );

    sub summation( @x ){
        say @x;
        my @y = @x;
        my @z = [];
        @z[0] = @y[1];
        loop (my $i = 0; $i < @y.elems; $i++) {
            @z[$i + 1] = @z[$i] + @y[$i + 2] if defined @y[$i + 2];
        }
        if @z.elems < 2 {
            say "Summation is '@z[* - 1]'";
        } else {
            summation(@z);
        }
    }
}

