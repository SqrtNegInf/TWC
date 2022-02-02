#!/usr/bin/env raku

#sub MAIN( Int $N where { $N > 0 } ) {
    my  $N = 20;
    my @fibonacci = 1, 1, * + * ... *;
    my $fibonacci-index = $N;
    my @numbers = lazy gather {
        for 0 .. Inf -> $i {
            take $i and $fibonacci-index += $N if @fibonacci[ 0 .. $fibonacci-index ].grep( $i.split( '' ).sum );;
        }
    };

    say my $result = @numbers[ 0 .. $N - 1 ].join( ',' );
    use Test;
    is $result, '1,2,3,5,8,10,11,12,14,17,20,21,23,26,30,32,35,41,44,49';
#}
