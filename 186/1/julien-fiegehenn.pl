#!/usr/bin/env perl
use strict;
use warnings;
use List::Util 'max';

# this only works with exactly two array references
sub zip {
    my ($one, $two) = @_;

    return map { $one->[$_], $two->[$_] } 0 .. max($#$one, $#$two);
}

use Test::More;

my @a = qw/1 2 3/;
my @b = qw/a b c/;

is_deeply [ zip(\@a, \@b) ], [ qw/1 a 2 b 3 c/ ], 'first example';
is_deeply [ zip(\@b, \@a) ], [ qw/a 1 b 2 c 3/ ], 'second example';

done_testing;
