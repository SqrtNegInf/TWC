#!/usr/bin/env perl
use v5.36;

use Test::More;
use Data::Dumper;

sub persistence_sort (@nums)
{
    return map { $_->[1] }
        sort   { $a->[0] <=> $b->[0] || $a->[1] <=> $b->[1] }
        map    { [ single_digit_multiplication_steps($_), $_ ] } @nums;
}

sub single_digit_multiplication_steps ($num)
{
    my $product = 1;
    for my $digit ( split( //, "$num" ) )
    {
        $product *= int($digit);
    }

    return $product < 10
        ? 1
        : 1 + single_digit_multiplication_steps($product);
}

sub test()
{
    my $multiplication_steps_tests = [
        [ 50, 1 ], [ 25, 2 ], [ 33, 1 ], [ 22, 1 ], [ 99, 2 ], [ 81, 1 ],
        [ 98, 3 ], [ 72, 2 ], [ 14, 1 ],
    ];
    for my $test (@$multiplication_steps_tests)
    {
        my ( $input, $expected ) = @$test;
        is_deeply $expected, single_digit_multiplication_steps($input),
            "input: $input, expected: $expected";
    }
    my $persistence_sort_tests = [ [ [ 15, 99, 1, 34 ], [ 1, 15, 34, 99 ] ] ];
    for my $test (@$persistence_sort_tests)
    {
        my ( $input, $expected ) = @$test;
        my $output = [ persistence_sort(@$input) ];
        is_deeply $expected, $output,
            "input: @$input, expected: @$expected, output: @$output";
    }
    done_testing;
}

test() unless caller();
