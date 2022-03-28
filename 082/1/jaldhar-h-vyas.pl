#!/usr/bin/env perl
use 5.020;
use warnings;
use English qw/ -no_match_vars /;

sub factors {
    my ($n) = @_;

    return grep { $n % $_ == 0; } 1 .. $n / 2;
}

my ($M, $N) = (100, 500);

my %f;
map { $f{$_}++; } factors($M);
map { $f{$_}++; } factors($N);

say join q{, }, sort grep { $f{$_} == 2; } keys %f;
