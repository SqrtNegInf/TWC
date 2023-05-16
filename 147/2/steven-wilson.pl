#!/usr/bin/env perl
use v5.36;

use POSIX qw/ fmod /;

my @pentagonal_numbers = qw/ 1 /;
my $first_pair_found   = 0;
my $number             = 2;

while ( not $first_pair_found ) {
    my $next_pn = pentagonal_number($number);
    for (@pentagonal_numbers) {
        if (    is_pentagonal_number( $next_pn - $_ )
            and is_pentagonal_number( $next_pn + $_ ) )
        {
            say "First pair is $_ and $next_pn";
            $first_pair_found = 1;
            last;
        }
    }
    push @pentagonal_numbers, $next_pn;
    $number++;
}

sub pentagonal_number {
    my $n = shift;
    return ( ( 3 * ( $n * $n ) ) - $n ) / 2;
}

sub is_pentagonal_number {
    my $x         = shift;
    my $remainder = fmod( sqrt( 24 * $x + 1 ) + 1, 6 );
    $remainder > 0 ? return 0 : return 1;
}
