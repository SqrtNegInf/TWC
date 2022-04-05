#!/usr/bin/env perl
use warnings;
use strict;
use 5.010;
use English qw/ -no_match_vars /;

sub usage() {
    print<<"-USAGE-";
Usage:
  $PROGRAM_NAME <N> <S>
  
    <N>    number of digits in match
    <S>    sum of digits in match
-USAGE-

    exit(1);
}

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
