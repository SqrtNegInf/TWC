#!/usr/bin/env perl
use v5.36;

use Data::Dump qw(dump);

my @examples = (
    [ 10, 1, 111, 24, 1000 ],
    [ 111, 1, 11111 ],
    [ 2, 8, 1024, 256 ],
);

sub count_even_digits_number {
    my $nums = shift;
    
    return grep {(length($_) % 2) eq 0} @$nums;
}

for my $elements (@examples) {
    my $cedn = count_even_digits_number $elements;

    say 'Input : @ints = ', dump(@$elements);
    say 'Output : ', $cedn;
    say ' ';
}
