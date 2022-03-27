#!/usr/bin/env perl
# Week 83 Task 1 solution by Steven Wilson.

use strict;
use warnings;
use Test::More;

my $ex1_t = "The Weekly Challenge";
my $ex2_t = "The purpose of our lives is to be happy";
my $ex3_t = "Markmið lífs okkar er að vera hamingjusöm";
ok( length_of_excerpt($ex1_t) == 6,  'Example 1' );
ok( length_of_excerpt($ex2_t) == 23, 'Example 2' );
ok( length_of_excerpt($ex3_t) == 32, 'Example 3' );
done_testing();

sub length_of_excerpt {
    my $input = shift;
    $input =~ s/^\w+|\w+$//g;    # trim first and last words
    $input =~ s/\s//g;           # remove whitespace
    return length $input;
}
