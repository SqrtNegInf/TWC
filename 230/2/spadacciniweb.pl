#!/usr/bin/env perl

use strict;
use warnings;

my @input = ("pay", "attention", "practice", "attend");
my $prefix = "at";
count_words(\@input, $prefix);

@input = ("janet", "julia", "java", "javascript");
$prefix = "ja";
count_words(\@input, $prefix);

exit 0;

sub count_words {
    my $words = shift || [];
    my $prefix = shift || '';

    printf "Output: %d\n", scalar map { $_ =~ /^$prefix/}
                                    @$words;
    return undef;
}
