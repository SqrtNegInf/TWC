#!/usr/bin/env perl
use strict;
use warnings;
use feature qw'say state signatures';
no warnings qw'experimental::signatures';

run() unless caller();

sub run() {
    my ($N) = 5;
    die "Expect a single digit positive number!\n" unless $N and $N =~ m/^\d$/;
    say four_is_magic($N);
}

sub four_is_magic($n) {
    ucfirst _four_is_magic($n);

}

sub _four_is_magic($n) {
    my %cardinal_representations = (
        1 => 'one',
        2 => 'two',
        3 => 'three',
        4 => 'four',
        5 => 'five',
        6 => 'six',
        7 => 'seven',
        8 => 'eight',
        9 => 'nine',
    );

    if ( $n == 4 ) {
        return 'four is magic.';
    }

    my $cardinal = $cardinal_representations{$n};
    my $length   = length $cardinal;

    return join( ', ',
        join( ' ', $cardinal, 'is', $cardinal_representations{$length} ),
        _four_is_magic($length) );
}
