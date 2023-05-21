#!/usr/bin/env perl
use v5.36;

while (<DATA>) {
    my %numbers;
    $numbers {$_} ++ for /[1-9][0-9]*/g;         # Read in data
    say grep {$numbers {$_} % 2} keys %numbers;  # Print the one occuring
                                                 # an odd number of times
}

__END__
2, 5, 4, 4, 5, 5, 2
1,2,3,4,3,2,1,4,4
