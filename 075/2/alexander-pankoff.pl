#!/usr/bin/env perl
use v5.36;

use Scalar::Util qw(looks_like_number);
use List::Util qw(any min max);

my ( @A ) = @ARGV;

@A = ( 2, 1, 4, 5, 3, 7 ) unless @A;

if ( any { !looks_like_number( $_ ) || $_ < 0 } ( @A ) ) {
    usage();
    exit 1;
}

print_histogram( @A );

say largest_rectangle( @A );

exit 0;

sub largest_rectangle(@cols) {
    return 0 unless @cols;

    max(
        rectangle_size( @cols ),
        largest_rectangle( @cols[ 1 .. $#cols ] ),
        largest_rectangle( @cols[ 0 .. ( $#cols - 1 ) ] )
    );
}

sub rectangle_size(@cols) {
    return scalar @cols * min @cols;
}

sub print_histogram(@cols) {
    my $height = max @cols;

    while ( $height ) {
        say join( ' ', $height, map { $_ >= $height ? '#' : ' ' } @cols );
        $height--;
    }

    say join( ' ', map { '_' } ( 0 .. @cols ) );
    say join( ' ', ' ', @cols );
}

sub usage() {
    say <<END
$0 [A]

  [A] An array of positive integers
END
}

