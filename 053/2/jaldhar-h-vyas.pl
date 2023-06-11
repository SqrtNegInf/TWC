#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

sub generate {
    my ($n) = @_;

    my %rules = (
        a => [qw/ e i /],
        e => [qw/ i /],
        i => [qw/ a e o u /],
        o => [qw/ a u /],
        u => [qw/ e o /]
    );

    my @generated;
    for my $i (1 .. $n) {
        if ($i == 1) {
            @generated = sort keys %rules;
        } else {
            @generated = map {
                my $e = $_;
                map {  $e . $_; } @{ $rules{substr $e, -1, 1} };
            } @generated;
        }
    }

    return @generated;
}


my $n = 3;

if ($n < 1 || $n > 5) {
    usage();
}

for my $i (generate($n)) {
    say $i;

}
