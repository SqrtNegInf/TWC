#!/usr/bin/env perl
use v5.36;
use utf8;

use List::Util qw(sum0);

my ($S) = 'Markmið lífs okkar er að vera hamingjusöm';

say words_length($S);

sub words_length($str) {
    my @words = grep { length $_ } split( /\s+/, $str );
    die "need 3 or more words\n" unless @words >= 3;
    return sum0( map { length $_ } @words[ 1 .. $#words - 1 ] );
}
