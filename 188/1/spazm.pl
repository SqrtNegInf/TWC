#!/usr/bin/env perl
use v5.36;

sub count_matching_pairs
{
    my ( $input, $size_n, $div_k ) = @_;

    my @mods = map { $_ % $div_k } @$input;

    my $count = 0;

    for my $i ( 0 .. @$input - 1 )
    {
        for my $j ( $i + 1 .. @$input - 1 )
        {
            my $test = $mods[$i] + $mods[$j];
            if ( $test == 0 or $test == $div_k )
            {
                $count++;
            }
        }
    }
    return $count;
}

use Test::More;
my $test_data = [
    [ [ 4, 5, 1, 6 ], 2 => 2 ],
    [ [ 1, 2, 3, 4 ], 2 => 2 ],
    [ [ 1, 3, 4, 5 ], 3 => 2 ],
    [ [ 5, 1, 2, 3 ], 4 => 2 ],
    [ [ 7, 2, 4, 5 ], 4 => 1 ],
];
for my $test (@$test_data)
{
    my ( $in, $k, $expected ) = @$test;
    is count_matching_pairs( $in, length( scalar @$in ), $k ), $expected;  # added 'scalar' as per 5.36 warning
}
done_testing;
