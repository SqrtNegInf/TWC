#!/usr/bin/env perl
use v5.36;

use utf8;
use Text::Unidecode qw/unidecode/;

sub makeover {
    my $what = shift;

    return unidecode($what);
}

use Test::More;

is( makeover('ÃÊÍÒÙ'), 'AEIOU' );
done_testing;

1;
