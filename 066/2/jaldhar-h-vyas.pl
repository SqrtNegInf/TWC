#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

sub isPower {
    my ($num) = @_;
    my @results;

    if ($num == 1) {
        push @results, join q{^}, (1, 1); 
    } else {
        for my $m (2 .. sqrt($num)) {
            my $n = 2; 
            my $p = $m ** $n; 
  
            while ($p <= $num && $p > 0) { 
                if ($p == $num) { 
                    push @results, join q{^}, ($m, $n);
                } 
                $n++; 
                $p = $m ** $n; 
            } 
        }
    } 

    return @results; 
}

my ($N) = 64;

my @powers = isPower($N);
say scalar @powers ? (join q{, }, @powers) : 0;
