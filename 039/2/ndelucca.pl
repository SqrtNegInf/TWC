#!/usr/bin/env perl

# https://perlweeklychallenge.org/blog/perl-weekly-challenge-039/
# Task #2
# Write a script to demonstrate Reverse Polish notation(RPN).
# Checkout the wiki page for more information about RPN.
# https://en.wikipedia.org/wiki/Reverse_Polish_notation

use strict;
use warnings;

@ARGV = '15 7 1 1 + - / 3 * 2 1 1 + + -';

my @stack;
my @rpn = split / /, shift;

while (@rpn) {

    my $in = shift @rpn;

    if ($in =~ /^\d+$/) {
        push @stack, $in;
    }else{
        my $num1 = pop @stack;
        my $num2 = pop @stack;
        push @stack, eval "$num2 $in $num1";
    }
}

print "Result: ",@stack, "\n";
