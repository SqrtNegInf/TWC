#!/usr/bin/env perl
use v5.36;

use Modern::Perl;

# https://rosettacode.org/wiki/Eertree#Perl
sub build_eertree {
    my($str) = @_;

    my @pal;
    for my $n (1 .. length($str)) {
        for my $m (1 .. length($str)-($n-1)) {
            my $strpal = substr($str, $n-1, $m);
            push @pal, $strpal if ($strpal eq reverse $strpal);
        }
    }

    my %seen;
    say join ' ', grep {not $seen{$_}++} @pal;
}

build_eertree(shift||'redivider');
