#!/usr/bin/env perl
use v5.36;

use List::Util qw{ min };

my @array = ( 1, 5, 0, 2, 9, 3, 7, 6, 4, 8 );
my $s = 3;

sliding_window( $s, \@array );

sub sliding_window ( $s, $arr ) {
    my @arr   = $arr->@*;
    my $max_n = $#arr;

    for my $n ( 0 .. $#arr ) {
        next if $n + 2 > $max_n;
        my $min = min map { $arr[$_] } $n .. $n + 2;

        print '[';
        for my $i ( 0 .. $#arr ) {
            print $i == $n ? '(' : ' ';
            print $arr[$i];
            print $i == $n +2 ? ')' : ' ';
        }
        say qq{] = Min ($min)};
    }
}

