#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use List::Util qw(first);

# Actually we have to return index only, thus:

sub return_idx
{
     my ($aref, $num) = @_;
     my %idx;
     @idx{@$aref} = keys @$aref;
     return $idx{$num} if exists $idx{$num};


     my $neighbour = first { $_ > $num } @$aref;
     my $should_be_placed = $neighbour ? $idx{$neighbour} : scalar @$aref;
     return $should_be_placed;
}

print return_idx([1, 2, 3, 4], 3), $/; # 2
print return_idx([1, 3, 5, 7], 6), $/; # 3


print return_idx([12, 14, 16, 18], 10), $/; # 0
print return_idx([11, 13, 15, 17], 19), $/, $/; # 4

# If we do have to modify the array:

sub search_insert
{
     my ($aref, $num) = @_;

     my %idx;
     @idx{@$aref} = keys @$aref;
     return $idx{$num} if exists $idx{$num};
     @$aref = sort {$a <=> $b} @$aref, $num;
     @idx{@$aref} = keys @$aref;
     return $idx{$num};
}


print search_insert([1, 2, 3, 4], 3), $/; # 2
print search_insert([1, 3, 5, 7], 6), $/; # 3

print search_insert([12, 14, 16, 18], 10), $/; # 0
print search_insert([11, 13, 15, 17], 19), $/; # 4
