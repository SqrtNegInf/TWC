#!/usr/bin/env perl
use v5.36;

use List::Util qw (min max);
use Data::Dump qw(dump);

my @examples = (
    [ 
        [ 3,  7,  8],
        [ 9, 11, 13],
        [15, 16, 17]
    ],
    [
		[ 1, 10,  4,  2],
        [ 9,  3,  8,  7],
        [15, 16, 17, 12]
    ],
    [
		[7 ,8],
        [1 ,2]
    ],
);

sub lucky_numbers {
    my $matrix = shift;
    my $len_rows = scalar @$matrix;
    my $len_cols = scalar @{$matrix->[0]};
    my $value;

    for (my $i = 0; $i < $len_rows; $i++) {
        my $min = min @{$matrix->[$i]};

        for (my $j = 0; $j < $len_cols; $j++) {
            my @cols = map {$_->[$j]} @$matrix;
            my $max = max @cols;
            
            return $matrix->[$i][$j] if ($min eq $max);
        }
    }
     
    return -1;
}

for my $elements (@examples) {
    my $ln = lucky_numbers $elements;

    say 'Input : $matrix = [';
    foreach my $x (@$elements) {
        printf("%15s%s,\n", ' ', dump($x))
    };
    printf("%14s\n", ']');
    say 'Output : ', $ln;
    say ' ';
}
