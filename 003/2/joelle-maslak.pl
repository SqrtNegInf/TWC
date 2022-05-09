#!/usr/bin/env perl

use v5.26;
use strict;
use warnings;

# Turn on method signatures
use feature 'signatures';
no warnings 'experimental::signatures';

my $rowcount = 10;

my @rows;

for ( my $i = 0; $i < $rowcount; $i++ ) {
    my @row;
    if ( !$i ) {
        @row = 1;
    } else {
        push @row, 1;
        for ( my $j = 1; $j < $i; $j++ ) {
            push @row, $rows[ $i - 1 ]->[ $j - 1 ] + $rows[ $i - 1 ]->[$j];
        }
        push @row, 1;
    }
    push @rows, \@row;

    for ( my $j = 1; $j < $rowcount - $i; $j++ ) { print("  ") }
    say join( " ", map { sprintf( "%3d", $_ ) } @{ $rows[$i] } );
}

