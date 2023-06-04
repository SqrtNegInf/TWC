#!/usr/bin/env perl
use v5.36;

my @A = ( 10, 20, 30, 40, 50 );
my @B = ( 3, 4 );

for my $index (@B) {
    say '[' . join( ', ', left_rotate( $index, @A ) ) . ']';
}

sub left_rotate ( $index, @array ) {
    while ( $index-- ) {
        my $top = shift @array;
        push @array, $top;
    }

    return @array;
}
