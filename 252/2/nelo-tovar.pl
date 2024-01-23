#!/usr/bin/env perl

use v5.28;
use strict;
use warnings;

srand 1;

use List::Util qw (min max);
use Data::Dump qw(dump);

my @examples = ( 5, 3, 1 , );

sub unique_sum_zero {
    my $n = shift;
    my @numbers = ();

    push @numbers,0 if ($n % 2 != 0) or ($n == 1);

    for (my $k = 1; $k <= $n / 2; $k++) {
        my $i = int rand(9) + 1;
        push @numbers, ($i, -$i)
    }
     
    return \@numbers;
}

for my $elements (@examples) {
    my $usz = unique_sum_zero $elements;

    say 'Input : $s = ', $elements;
    say 'Output : ', dump($usz);
    say ' ';
}
