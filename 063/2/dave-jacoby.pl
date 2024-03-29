#!/usr/bin/env perl
use v5.36;

use Carp;

my $word = 'xyxx';

say rotate_string($word);

sub rotate_string( $word ) {
    say $word;
    my $l    = length $word;
    my $c    = 0;
    my $copy = $word;
    while (1) {
        my $m    = $c % $l;
        $c++;
        my @copy = split //, $copy;
        for ( 0 .. $m ) {
            push @copy, shift @copy;
        }
        $copy = join '', @copy;
        return $c if $word eq $copy;
        exit if $c > 10;
    }
    return 1;
}
