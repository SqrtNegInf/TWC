#!/usr/bin/env perl
use v5.36;

sub compose($f, $g) {
    return sub { $f->($g->(@_)) };
}

sub sum {
    my $sum = 0;
    $sum += $_ for @_;
    return $sum;
}

sub double {
    return map { $_ * 2 } @_;
}

$, = " ";
my $c = compose(\&sum, \&double);
say $c->(1,2,3,4);

