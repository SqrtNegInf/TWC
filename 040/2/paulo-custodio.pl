#!/usr/bin/env perl
use v5.36;

my @list = (10, 4, 1, 8, 12, 3);
my @indices = (0,2,5);

@list = sort_sublist(\@list, \@indices);
say "[", join(", ", @list), "]";

sub sort_sublist {
    my($list, $indices) = @_;
    my @list = @$list;
    my @indices = @$indices;
    my @values = sort {$a<=>$b} @list[@indices];
    @list[@indices] = @values;
    return @list;
}
