#!/usr/bin/env perl
use v5.36;

my @list = (5, 9, 2, 8, 1, 6);
die 'List should have at leat 2 numbers' if @list < 2;

my $order = shift || 1;
die 'Max order is '.$#list if $order > $#list;

for (1 .. $order) {
    @list = map {$list[$_] - $list[$_-1]} (1 .. $#list);
    print join(',', @list).$/;
}
