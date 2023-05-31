#!/usr/bin/env perl
use v5.36;

sub flatten_tree {
    my ($list, $tree) = @_;

    return unless defined $tree;

    my ($number, $left, $right) = @$tree;

    push @$list, $number;
    flatten_tree($list, $left);
    flatten_tree($list, $right);
}

my @list;

flatten_tree(\@list, [1, [2, [4], [5, [6], [7]]], [3]]);

$, = ' -> ';
say @list;
