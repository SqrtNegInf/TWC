#!/usr/bin/env perl
use v5.36;

my @matrix;
my $LENGTH = 3;
my @location = (0, int($LENGTH / 2));
my $value = 1;
my $max_value = $LENGTH * $LENGTH + 1;

while ($value < $max_value) {
    
    if (!defined($matrix[$location[0]][$location[1]])) {
        $matrix[$location[0]][$location[1]] = $value++;
        $location[0] = ($location[0] - 1) % $LENGTH;
        $location[1] = ($location[1] + 1) % $LENGTH;
    } else {
        $location[0] = ((($location[0] + 1) % $LENGTH) + 1) % $LENGTH;
        $location[1] = ($location[1] - 1) % $LENGTH;
    }
}

foreach my $line (@matrix) {
    printf("[ %d %d %d ]\n", $line->[0], $line->[1], $line->[2]);
}

exit 0;
