#!/usr/bin/env perl
#use v5.36;
package main;
use strict;
no warnings;

sub get_permuted_multiple {

    my $i = 0;
    while (1) {
        $i++;
        my @sorted_a = sort { $a cmp $b } split //, $i;

        my $is_var_ok = 1;

        for my $j ( 2 .. 6 ) {
            my @sorted_j = sort { $a cmp $b } split //, $j * $i;

            unless ( @sorted_a ~~ @sorted_j ) {
                $is_var_ok = 0;
                last;
            }
        }

        return $i if $is_var_ok;
    }

    return -1;
}

use Test::More;

is( get_permuted_multiple(), 142857 );
done_testing;
1;
