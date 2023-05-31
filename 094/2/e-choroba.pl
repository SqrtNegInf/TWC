#!/usr/bin/env perl
use v5.36;

use enum qw( VALUE FIRST_CHILD SECOND_CHILD NEXT=1 );

sub bt2l {
    my ($tree) = @_;
    return unless defined $tree;

    return $tree->[VALUE],
           bt2l($tree->[FIRST_CHILD]),
           bt2l($tree->[SECOND_CHILD])
}

sub bt2ll {
    my ($tree) = @_;
    my @list = bt2l($tree);
    my $ll = my $element = [];
    for my $i (0 .. $#list) {
        $element->[VALUE] = $list[$i];
        $element = $element->[NEXT] = [] unless $i == $#list;
    }
    return $ll
}

sub to_string {
    my ($ll) = @_;
    return unless $ll;

    return join ' -> ', $ll->[VALUE], to_string($ll->[NEXT])
}

use Test::More tests => 2;
is_deeply bt2ll([1, [2, [4], [5, [6], [7]]], [3]]),
    [1, [2, [4, [5, [6, [7, [3]]]]]]],
    'Example 1';

is to_string(bt2ll([1, [2, [4], [5, [6], [7]]], [3]])),
    '1 -> 2 -> 4 -> 5 -> 6 -> 7 -> 3',
    'String representation';
