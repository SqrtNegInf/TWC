#!/usr/bin/env perl
use v5.36;

my $n = shift || 5; 
my @results = map { $_, -$_ } (1 .. $n / 2);

unless ($n % 2 == 0) {
    push @results, 0;
}

say q{(}, (join q{, }, sort @results), q{)};
