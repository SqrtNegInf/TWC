#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use List::Util qw(sum);
use Test2::V0 -srand => 1;

sub max_pairs
{
     my @arr = @_;
     my %counter;
     for my $idx ( 0 .. $#arr )
     {
          my $elm = $arr[$idx];
          my $rev = reverse $elm;
          next if exists $counter{$elm};
          do { $counter{$elm}++ if /$rev/} for @arr[$idx + 1 .. $#arr];
     }
     return values %counter ? sum(values %counter) : 0;
}

is(max_pairs("ab", "de", "ed", "bc"), 1, 'Example 1');
is(max_pairs("aa", "ba", "cd", "ed"), 0, 'Example 2');
is(max_pairs("uv", "qp", "st", "vu", "mn", "pq"), 2, 'Example 3');
done_testing();
