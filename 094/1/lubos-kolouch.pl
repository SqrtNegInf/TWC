#!/usr/bin/env perl
use v5.36;

sub get_anagrams {
    my $what = shift;

    my %group;

    for my $elem (@$what) {
        my @sorted = sort split //, $elem;
        my $joined = join '', @sorted;

        push @{$group{$joined}}, $elem;
    }

    my @ret_arr = values %group;
    return \@ret_arr;
}


use Test::More;

my $result = get_anagrams(["opt", "bat", "saw", "tab", "pot", "top", "was"]);
is(scalar @$result, 3);

$result = get_anagrams(["x"]);
is(scalar @$result, 1);

done_testing;

