#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;

is(sort_by_1_bits(0, 1, 2, 3, 4, 5, 6, 7, 8), [0, 1, 2, 4, 8, 3, 5, 6, 7], 'Example 1');
is(sort_by_1_bits(1024, 512, 256, 128, 64), [64, 128, 256, 512, 1024], 'Example 2');
done_testing();



sub sort_by_1_bits
{
     return [sort { count_set_bits($a) <=> count_set_bits($b) || $a <=> $b } @_];
}



sub count_set_bits
{
     my $dec = $_[0];
     my $bit_string = sprintf ("%b", $dec);
     my $bit_count = $bit_string =~ tr/1/1/;
     return $bit_count;
}

