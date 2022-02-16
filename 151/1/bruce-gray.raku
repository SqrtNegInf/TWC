#!/usr/bin/env raku

#fewer tests  :-)

constant $Null_char = '*';
sub is_null ( Str $s ) { $s eq $Null_char }

sub minimum_depth_of_binary_tree ( Str $binary_tree_in_linear_format ) {
    my @rows = $binary_tree_in_linear_format.split: '|';

    my @last_row = 'anything_but_asterisk';

    for @rows.kv -> $k, $row_string {
        my @row = $row_string.words;
        push @row, $Null_char while @row < 2**$k;

        @last_row = @row if $k == 0;

        for @row.batch(2) Z @last_row -> ($batch, $parent) {
            return $k if   $parent.&is_null.not
                     and $batch[0].&is_null
                     and $batch[1].&is_null;
        }

        @last_row = @row;
    }

    return +@rows;
}

my @tests = (
# From task description:
    2 => '1 | 2 3 | 4 5',
    3 => '1 | 2 3 | 4 *  * 5 | * 6',

    # Generated
    2 => '0 | * 2 | |',
    2 => '0 | * 2 | * * * * | * * * * * * * *',
    3 => '0 | * 2 | * * * 6 |',
    3 => '0 | * 2 | * * * 6 | * * * * * * * *',
    4 => '0 | * 2 | * * * 6 | * * * * * * * E',
    4 => '0 | * 2 | * * * 6 | * * * * * * * E',
    4 => '0 | * 2 | * * * 6 | * * * * * * D',
    4 => '0 | * 2 | * * * 6 | * * * * * * D *',
    4 => '0 | * 2 | * * * 6 | * * * * * * D E',
    4 => '0 | * 2 | * * * 6 | * * * * * * D E',
    3 => '0 | * 2 | * * 5 |',
    4 => '0 | 1 2 | 3 4 5 6 | 7 8 9 A B C D E',
);

use Test;
plan +@tests;
for @tests -> ( :key($expected), :value($in) ) {
    is minimum_depth_of_binary_tree($in), $expected, "$expected => $in";
}
