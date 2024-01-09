#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand => 1;

use Data::Dumper;
use List::Util qw/max/;

my $cases = [
    ["perl", "2", "000", "python", "r4ku"],
    ["001", "1", "000", "0001"],
];

sub alnum_string_value
{
    my $l = shift;

    return max(map { /^\d+$/ ? $_+0 : length } @$l);
}

is(alnum_string_value($cases->[0]), 6, 'Example 1');
is(alnum_string_value($cases->[1]), 1, 'Example 2');
done_testing();

exit 0;

         
