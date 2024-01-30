#!/usr/bin/env perl

use strict;
use warnings;

use List::Util qw/sum/;


my $matrix = [
               [1, 1, 0, 0, 0],
               [1, 1, 1, 1, 0],
               [1, 0, 0, 0, 0],
               [1, 1, 0, 0, 0],
               [1, 1, 1, 1, 1]
             ];
order_rows($matrix);

$matrix = [
               [1, 0, 0, 0],
               [1, 1, 1, 1],
               [1, 0, 0, 0],
               [1, 0, 0, 0]
             ];
order_rows($matrix);

exit 0;

sub order_rows {
    my $matrix = shift;

    my %sum_rows;
    foreach my $i (0..(scalar(@$matrix) -1)) {
        $sum_rows{$i} = sum(@{ $matrix->[$i] });
    }

    printf "Output: (%s)\n", join ', ' , map { $_ }
                                           sort { $sum_rows{$a} <=> $sum_rows{$b}
                                                                ||
                                                             $a <=> $b
                                                } keys %sum_rows;

    return 0;
}
