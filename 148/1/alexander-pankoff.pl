#!/usr/bin/env perl
use v5.36;

run() unless caller();

sub run() {
    say join( ", ", eban_numbers() );
}

sub eban_numbers {
    my @eban = grep { is_eban($_) } 1 .. 100;
	return @eban;

}

# only works for numbers up between 1 and 100
sub is_eban($n) {
    if ( length $n == 1 ) {
        return grep { $n == $_ } qw(0 2 4 6);
    }
    if ( length $n == 2 ) {
        my ( $n1, $n2 ) = split( '', $n );
        return ( grep { $n1 == $_ } qw{3 4 5 6} ) && is_eban($n2);
    }
    return 0;
}
