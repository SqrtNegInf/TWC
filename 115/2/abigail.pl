#!/usr/bin/env perl
use v5.36;

my @DIGITS = (0 .. 9);
my @EVENS  = grep {$_ % 2 == 0} @DIGITS;

while (<DATA>) {
    #
    # Read in data, store counts of each digit.
    #
    my @digits = (0) x @DIGITS;
    $digits [$_] ++ for do {local $" = ""; /[@DIGITS]/g};

    #
    # The last number of the output should be the smallest
    # even number in the input. If there is no even number
    # in the input, skip it.
    #
    my ($last) = grep {$digits [$_]} @EVENS;
    next unless defined $last;
    $digits [$last] --;

    #
    # Print the result, with the highest numbers first.
    #
    print join "" => map {$_ x $digits [$_]} reverse @DIGITS;
    say $last;
}

__END__
4 1 7 6
1 2 0 6
