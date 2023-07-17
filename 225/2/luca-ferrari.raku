#!/usr/bin/env raku

#sub MAIN( *@numbers where { @numbers.grep( * ~~ Int ).elems == @numbers.elems } ) {
my @numbers = 10, 4, 8, 3;
    my ( @left, @right );

    @left.push: 0;
    @left.push: @numbers[ 0 .. $_ ].sum for 0 ..^ @numbers.elems - 1;

    @right.push: @numbers[ $_ .. * ].sum for 1 ..^ @numbers.elems;
    @right.push: 0;

    say @left;
    say @right;

    (@left Z[-] @right).map( { $_.abs } ).say;
#}
