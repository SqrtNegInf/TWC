#!/usr/bin/env perl
use v5.36;

my ( $m, $n ) = (5,3);

my @combinations = get_combinations( 1, $m, $n - 1 );
print join( "\n", @combinations ) . "\n";

sub get_combinations {
    my ( $min, $m, $n ) = @_;

    my @combinations = ();
    if ( $n ) {
        for my $i ( $min .. ( $m - 1 )) {
            for my $combo ( get_combinations( $i + 1, $m, $n - 1 ) ) {
                push( @combinations, $i . $combo );
            }
        }
    } else {
        @combinations = ( $min .. $m );
    }

    return @combinations;
}
