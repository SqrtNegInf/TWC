#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);

sub main() {

    my @matchwords = intersection( map { substrings($_) }  <zabc xabcy abcd> );
    if ( scalar(@matchwords) ) {
        my $max = max map { length($_) } @matchwords;
        my (@longwords) = grep { length($_) == $max } @matchwords;
        say "Max length: $max; Substrings: " . join( " ", @longwords );
    } else {
        say "No substrings in common";
    }

    return;
}

sub substrings($word) {
    my %ret;

    for ( my $i = 0; $i < length($word); $i++ ) {
        for ( my $j = 1; $j < ( length($word) + 1 - $i ); $j++ ) {
            $ret{ substr( $word, $i, $j ) } = 1;
        }
    }

    return [ keys %ret ];
}

sub intersection ( $first, $second, @sets ) {
    my %hash1 = map { $_ => 1 } $first->@*;
    my %hash2 = map { $_ => 1 } $second->@*;

    my @common;
    for my $k ( keys %hash1 ) {
        push @common, $k if ( exists $hash2{$k} );
    }

    if ( scalar(@sets) ) {
        return intersection( \@common, @sets );
    } else {
        return @common;
    }
}

main();
