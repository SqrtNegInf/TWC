#!/usr/bin/env raku

#multi sub MAIN( *@input ) {
#    my @lines = @input.map( *.split(",") );
#    die "Not a triangle" unless [==] 1, |(@lines.map( *.elems ).rotor(2=>-1).map( { @^a[1] - @^a[0] } ) );
#    say smallest-route( @lines );
#}

#multi sub MAIN("test") {
    use Test;
    is( 8, smallest-route( [ [1], [2,4], [6,4,9], [5,1,7,2] ] ) );
    is( 7, smallest-route( [ [3], [3,1], [5,2,3], [4,3,1,3] ] ) );
#}

multi sub smallest-route( @start ) {
    return smallest-route( @start[0], @start[1..*-1], 0 );    
}

multi sub smallest-route( @head, [], $index ) {
    return @head[$index];
}

multi sub smallest-route( @head, @rest, $index ) {
    my @opts = [
        smallest-route( @rest[0], @rest[1..*-1], $index ),
        smallest-route( @rest[0], @rest[1..*-1], $index+1 )
    ];
    return @head[$index] + (@opts[0] < @opts[1] ?? @opts[0] !! @opts[1]);
}
