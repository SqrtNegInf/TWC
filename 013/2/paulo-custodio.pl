#!/usr/bin/env perl

use Modern::Perl;

sub F {
    my($n) = @_;
    return 1 if $n==0;
    return $n - M( F($n - 1) );
}

sub M {
    my($n) = @_;
    return 0 if $n==0;
    return $n - F( M($n - 1) );
}

my $N = shift || 21;

say "F: ", join(", ", map {F($_)} 0..$N-1), ", ...";
say "M: ", join(", ", map {M($_)} 0..$N-1), ", ...";
