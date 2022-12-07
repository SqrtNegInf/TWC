#!/usr/bin/env perl
use strict;
use warnings FATAL => 'all';

use Test2::V0 -srand => 1;

is(oddString("adc", "wzy", "abc"), "abc", 'Example 1');
is(oddString("aaa", "bob", "ccc", "ddd"), "bob", 'Example 2');

sub oddString {
    my (@strings_list) = @_;

    my %strings_list_diff_hash = ();

    foreach my $string (@strings_list) {
        my $diff = join(',', map {
            ord(substr($string, $_ + 1, 1)) - ord(substr($string, $_, 1))
        } (0..length($string) - 2));

        push(@{$strings_list_diff_hash{$diff}}, $string)
    }

    foreach my $diff (keys(%strings_list_diff_hash)) {
        if (scalar(@{$strings_list_diff_hash{$diff}}) == 1) {
            return($strings_list_diff_hash{$diff}[0]);
        }
    }
}

done_testing()
