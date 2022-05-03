#!/usr/bin/env perl

use strict;
use warnings;

my $n = 20;

print "female sequence: ";
for ( 0 .. $n ) {
    print &f($_) . ", ";
}
print "...\n";

print "  male sequence: ";
for ( 0 .. $n ) {
    print &m($_) . ", ";
}
print "...\n";

sub f {
    my $n = shift;
    if ( $n == 0 ) {
        return 1;
    }
    elsif ( $n > 0 ) {
        return ( $n - &m( &f( $n - 1 ) ) );
    }
}

sub m {
    my $n = shift;
    if ( $n == 0 ) {
        return 0;
    }
    elsif ( $n > 0 ) {
        return ( $n - &f( &m( $n - 1 ) ) );
    }
}
