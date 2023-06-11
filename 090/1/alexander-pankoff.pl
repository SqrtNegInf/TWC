#!/usr/bin/env perl
use v5.36;

{
    my ( $sequence ) = 'GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG';
    die 'need dna sequence' unless $sequence;
    my %complements = ( T => 'A', G => 'C' );
    %complements = ( %complements, reverse %complements );

    say 'Nucleiobase count: ' . length( $sequence );
    say 'Complementary sequence: ' . join( '', map { $complements{$_} } split( '', $sequence ) );
}
