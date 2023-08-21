#!/usr/bin/env perl
use v5.36;

sub separate_digits (@ints) {
    return map { split // } @ints;
}

sub print_array (@array) {
    return say '(', join(', ', @array), ')';
}

print_array(separate_digits(1, 34, 5,  6));
print_array(separate_digits(1, 24, 51, 60));
