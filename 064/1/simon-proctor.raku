#!/usr/bin/env raku

#| Find the path from the top right of the grid to the
#| Bottom left that sums up to the least amount.
sub MAIN (
) {
    my @grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
];


    my @short-route = route-to( (0,0), (@grid[0].end,@grid.end) ).sort( -> @route { score-route( @grid, @route ) } )[0];
    
    
    say score-route( @grid, @short-route[0] );
}

multi sub score-route( @grid, @route ) {
    [+] @route.map( -> ( $x, $y ) { @grid[$y][$x] } );
}

multi sub route-to ( @s, @e where { @s ~~ @e } ) { return [ [@s,], ] }

multi sub route-to( @s, @e ) {
    my @routes;
    if ( @s[0] !~~ @e[0] ) {
        for route-to( ( @s[0]+1, @s[1] ), @e ) -> @route {
            @routes.push( @route.unshift( @s ) );
        }
    }
    if ( @s[1] !~~ @e[1] ) {
        for route-to( ( @s[0], @s[1]+1 ), @e ) -> @route {
            @routes.push( @route.unshift( @s ) );
        }
    }
    @routes;
}
