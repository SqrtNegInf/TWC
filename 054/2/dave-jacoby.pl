#!/usr/bin/env perl
use v5.36;

use Carp;

my $n = 23;
my @output = collatz($n);
say join ' → ', @output;

sub collatz ( $n ) {
    $n = int $n;
    croak if $n < 1;
    my @sec;
    if ( $n == 1 ) {
        push @sec, 1;
    }
    elsif ( $n % 2 == 1 ) {    #odd
        my $o = ( 3 * $n ) + 1;
        push @sec, $n, collatz($o);
    }
    elsif ( $n % 2 == 0 ) {    #even
        my $o = $n / 2;
        push @sec, $n, collatz($o);
    }
    return wantarray ? @sec : \@sec;
}
