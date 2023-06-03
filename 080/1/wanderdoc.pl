#!/usr/bin/env perl

use Test::More;

sub smallest_positive_missing
{
     my @arr = @_;

     my $str = '';
     my @positives = grep $_ > 0, @arr;

     return "No positives!" unless  @positives;
     vec($str, $_, 1) = 1 for @positives;
     my $bits = substr(unpack("b*", $str), 1);
     return index($bits, 0) + 1;
}

is(smallest_positive_missing(5, 2, -2, 0), 1, 'Example 1');
is(smallest_positive_missing(1, 8, -1),    2, 'Example 2');
is(smallest_positive_missing(2, 0, -1),    1, 'Example 3');
is(smallest_positive_missing( -10),    'No positives!', 'Negative only');
#is(smallest_positive_missing(1 .. 10_000_000), 10000001, 'Many positives');
done_testing();
