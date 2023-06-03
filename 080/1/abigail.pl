#!/usr/bin/env perl
use v5.36;

#     You are given unsorted list of integers @N.
#     Write a script to find out the smallest positive number missing.

while (<DATA>) {
    #
    # Read a line of input, extract the integers, and store
    # them in a hash %N.
    #
    my %N;
    @N {/-?[0-9]+/g} = ();

    #
    # Find the missing number: start with 1, increament as long
    # as it's in %N. We'll stop as soon as we find the missing number.
    #
    my $try = 1;
    $try ++ while exists $N {$try};
    say $try;
}

__END__
5 2 -2 0
1 8 -1
2 0 -1
