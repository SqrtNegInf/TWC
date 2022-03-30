#!/usr/bin/env raku

my @numbers = <9 10 7 5 6 1>;

say "({ join ", ", leader-elements @numbers })";
say "({ join ", ", leader-elements-recursive @numbers })";
say "({ join ", ", leader-elements-filter @numbers })";

sub leader-elements( @n ) {
    my $max = -Inf;
    ( reverse @n.reverse.grep: -> $n { $max = $n but True if $n > $max } ) || 0 }

sub leader-elements-recursive( @stuff ) {
    sub find( $that, *@the-rest ) {
        take $that      if $that > all @the-rest;
        find |@the-rest if @the-rest }

    +@stuff ?? gather find |@stuff !! 0 
}

#
sub leader-elements-filter( @A ) {
    (^@A)
        .grep( -> $i { @A[ $i ] > @A[ $i^..* ].all } )
        .map(  -> $i { @A[ $i ]                    } ) 
}
