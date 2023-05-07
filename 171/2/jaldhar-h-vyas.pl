#!/usr/bin/env perl
use v5.36;

sub compose {
    my ($f, $g) = @_;

    return sub { $f->($g->(@_)); };
}

sub square {
    my ($x) = @_;

    return $x * $x;
}

sub sum {
    my $total = 0;

    for my $elem (@_) {
        $total += $elem;
    }

    return $total;
}

say compose(\&square, \&sum)->(1,2,3);
