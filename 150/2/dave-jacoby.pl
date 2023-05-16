#!/usr/bin/env perl
use v5.36;

display_pretty( square_free_integers() );

sub square_free_integers () {
    my @sfi;
    my $max = 500;

OUTER: for my $i ( 1 .. $max ) {
        my @factors = factors($i);
        for my $f (@factors) {
            my $g = () = grep { /$f/ } @factors;
            next OUTER if $g > 1;
        }
        push @sfi, $i;
    }

    return @sfi;
}

sub factors ( $n ) {
    my @factors;
    my $i = 2;
    while ( $i < $n ) {
        while ( $n % $i == 0 ) {
            $n /= $i;
            push @factors, $i;
        }
        $i++;
    }
    return @factors;
}

sub display_pretty( @arr ) {
    my ( $wchar, undef ) = 80; #GetTerminalSize();
    $wchar //= 80;
    my $line;

    while ( scalar @arr > 1 ) {
        my $n = shift @arr;
        $line .= qq{$n, };
        if ( (length $line )+ 5 > $wchar ) {
            say $line;
            $line = '';
        }
    }
    $line .= shift @arr;
    say $line;
}
