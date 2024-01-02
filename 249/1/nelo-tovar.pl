#!/usr/bin/env perl
use v5.36;

use Data::Dump qw(dump);

my @examples = (
    [ 3, 2, 3, 2, 2, 2 ],
    [ 1, 2, 3, 4 ],
);

sub equal_pairs {
    my $ints = shift;
    my @numbers = @$ints;
    my @pairs;

    while (my $number = shift(@numbers)) {
       my $length = scalar @numbers;

       for (my $i = 0; $i < $length; $i++) {
           if ($number == $numbers[$i]) {
               push @pairs, [($number, $number)];
               splice @numbers, $i, 1;
               last;
           }
       }
    }
    
    return \@pairs;
}

for my $elements (@examples) {
    my $ep = equal_pairs $elements;

    say 'Input : @ints = ', dump(@$elements);
    say 'Output : ', dump(@$ep);
    say ' ';
}
