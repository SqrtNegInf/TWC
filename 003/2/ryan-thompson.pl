#!/usr/bin/env perl

use v5.36;
#use warnings;
#use strict;
no warnings 'uninitialized';

my $height = 10;

say "@{$_}" for pascal_triangle($height);

sub pascal_triangle {
    my $h = shift;

    my @tri = [1];
    push @tri, [ 1, map { $tri[-1][$_-1] + $tri[-1][$_] } 1..$_ ] for 1..$h-1;

    @tri;
}
