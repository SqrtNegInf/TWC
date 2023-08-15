#!/usr/bin/env perl
use 5.030;

use strict;
use warnings;

sub unique {
    my ($arr) = @_;
    my %unique;
    for my $elem (@{$arr}) {
        $unique{$elem}++;
    }

    return keys %unique;
}

sub union {
    my %count;
    my ($arr1, $arr2, $arr3) = @_;

    foreach my $elem (@{$arr1}, @{$arr2}, @{$arr3}) { $count{$elem}++ };
    return keys %count;
}

sub intersection {
    my ($arr1, $arr2) = @_;
    my %count;

    foreach my $elem (unique($arr1), unique($arr2)) { $count{$elem}++ };
    return [ grep { $_ if $count{$_} > 1 } keys %count ];
}

#my ($array1, $array2, $array3) = map { [split / /] } @ARGV;
my $array1 = [4,]; my $array2 = [2, 4]; my $array3 = [1,2,4];

say 
    q{(},
    (
        join q{, },
        (
            sort { $a <=> $b } 
            union(
                intersection($array1, $array2),
                intersection($array2, $array3),
                intersection($array1, $array3)
            )
        )
    ),
    q{)};
