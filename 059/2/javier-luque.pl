#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw /combinations/;

my $answer = 0;

my @ARGV = (2,3,4);

my $combinations = combinations(\@ARGV, 2);
while (my $v = $combinations->next) {
    $answer += f(@$v);
}

say $answer;

sub f {
    return calculate_true_bits(int(shift) ^ int(shift));
}

# Calculate the number of true bits
sub calculate_true_bits {
    my $number = shift;
    my $count = 0;

    do {
    	$count++ if ($number & 1);
    } while ($number = $number >> 1);

    return $count;
}
