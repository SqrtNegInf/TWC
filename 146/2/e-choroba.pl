#!/usr/bin/env perl
use v5.36;

sub parent {
    my ($x, $y) = @_;
    return $x < $y ? ($x, $y - $x) : ($x - $y, $y)
}

sub grandparent {
    return parent(parent(@_))
}

use Test2::V0 -srand => 1234;
plan 4;

{   my $member = [3, 5];
    is [parent(@$member)],      [3, 2], 'Example 1 parent';
    is [grandparent(@$member)], [1, 2], 'Example 1 grandparent';
}
{   my $member = [4, 3];
    is [parent(@$member)],      [1, 3], 'Example 2 parent';
    is [grandparent(@$member)], [1, 2], 'Example 2 grandparent';
}
