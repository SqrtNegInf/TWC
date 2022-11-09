#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;
use Algorithm::Combinatorics qw(subsets);

is array_degree(1, 3, 3, 2)   , [3, 3],       'Example 1';
is array_degree(1, 2, 1, 3)   , [1, 2, 1],    'Example 2';
is array_degree(1, 3, 2, 1, 2), [2, 1, 2],    'Example 3';
is array_degree(1, 1, 2, 3, 2), [1, 1],       'Example 4';
is array_degree(2, 1, 2, 1, 1), [1, 2, 1, 1], 'Example 5';

done_testing;

sub array_degree(@list) {
    my %h;
    my $x = join(q{}, @list);
    my %seen;
    foreach my $k (2 .. scalar(@list)) {
        my $entries = subsets(\@list, $k);
        while (my $entry = $entries->next) {
            my $y = join(q{}, @$entry);
            next if $seen{$y};
            next unless ($x =~ /$y/);
            $h{ join(":", @$entry) } = _array_degree($entry);
            $seen{$y} = 1;
        }
    }

    my $d = $h{[ sort { $h{$b} <=> $h{$a} } keys %h ]->[0]};
    my $s = 0;
    my $r;
    foreach my $e (keys %h) {
        if ($h{$e} == $d) {
            if ($s == 0 || length($e) <= $s) {
                $r = $e;
                $s = length($e);
            }
        }
    }

    return [ split /\:/, $r ];
}

sub _array_degree($data) {
    my %e; ++$e{$_} for @$data;
    return $e{[ sort { $e{$b} <=> $e{$a} } keys %e ]->[0]};
}
