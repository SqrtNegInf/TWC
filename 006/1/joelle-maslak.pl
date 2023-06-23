#!/usr/bin/env perl
use v5.36;
use v5.26;
use strict;
use warnings;

# Turn on method signatures
use feature 'signatures';
no warnings 'experimental::signatures';

use autodie;

my $run;
my @runs;

for my $num ( sort( { $a <=> $b } <1 2 3 4 9 10 14 15 16> ) ) {
    if ( !defined $run ) {
        $run = [ $num, $num ];
    } else {
        if ( $run->[1] == $num - 1 ) {
            $run->[1] = $num;
        } else {
            push @runs, $run;
            $run = [ $num, $num ];
        }
    }
}
push @runs, $run if defined $run;

say join( ",", map( { ( $_->[0] != $_->[1] ) ? join( '-', @$_ ) : $_->[0] } @runs ) );

