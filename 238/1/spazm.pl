#!/usr/bin/env perl
use v5.36;

use Test::More;

sub running_sum (@nums)
{
    my $current_sum = 0;
    my @running_sum = ();
    for my $i (@nums)
    {
        $current_sum += $i;
        push @running_sum, $current_sum;
    }
    return @running_sum;
}

sub test()
{
    my $tests = [
        [ [ 1, 2, 3, 4, 5 ], [ 1, 3, 6, 10, 15 ] ],
        [ [ 1, 1, 1, 1, 1 ], [ 1, 2, 3, 4,  5 ] ],
        [ [ 0, -1, 1, 2 ], [ 0, -1, 0, 2 ] ],
    ];
    for my $test (@$tests)
    {
        my ( $input, $expected ) = @$test;
        is_deeply [ running_sum(@$input) ], $expected,
            "input: @$input, expected: @$expected";
    }
    done_testing();
}

test() if not caller();
