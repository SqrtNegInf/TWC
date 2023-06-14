#!/usr/bin/env perl
use v5.36;

my %values = (
    Red => 9,
    Green => 5,
    Yellow => 7,
    Blue => 8,
);

# each ring components with unknown value at the end
my @rings_components = (
    ['Red','RedGreen'],
    ['Green','RedGreen','GreenBlack'],
    ['Blue','YellowBlue'],
    ['Yellow','YellowBlue','BlackYellow'],
    ['GreenBlack','BlackYellow','Black']
);

foreach my $ring (@rings_components) {
    my $internal_sum = 11;
    foreach my $c (@$ring){
        $values{$c} = $internal_sum unless defined $values{$c};
        $internal_sum -= $values{$c};
    }
}

printf "%s => %d\n",$_,$values{$_} for sort keys %values;
