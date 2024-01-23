#!/usr/bin/env perl
use v5.36;

use Data::Dump qw(dump);

my @examples = (
    [ 1, 2, 3, 4 ],
    [ 2, 7, 1, 19, 18, 3 ],
);

sub special_numbers {
    my $ints = shift;
    my $n = scalar @$ints;
    my $sum = 0;

    foreach my $x (@$ints) {
        $sum += $x ** 2 unless ($n % $x);
    }
    
    return $sum;
}

for my $elements (@examples) {
    my $sn = special_numbers $elements;

    say 'Input : @ints = ', dump(@$elements);
    say 'Output : ', $sn;
    say ' ';
}
