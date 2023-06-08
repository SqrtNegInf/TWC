#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

sub X {
    my @a = @{ $_[0] };
    my @b = @{ $_[1] };

    return map {
        my $first = $_;
        map { 
            [ ref $first eq 'ARRAY' ? @{$first} : $first, $_ ];
        } @b;
    } @a;
}

my ($N, $S) = (2,10);

my @digits = 1 .. 9;

for (1 .. $N - 1) {
    @digits = X(\@digits, [0 .. 9]);
}

@digits = map { join q{}, @{$_}; }
    grep { my $accum; map {$accum += $_; } @{$_}; $accum == $S; }
    @digits;

say join q{, }, @digits;
