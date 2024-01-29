#!/usr/bin/env perl

use strict;
use warnings;

my @words = ("one.two.three","four.five","six");
my $separator = ".";
split_strings(\@words, $separator);

@words = ('$perl$$', '$$raku$');
$separator = '$';
split_strings(\@words, $separator);

sub split_strings {
    my $words = shift;
    my $separator = shift;

    printf "Output: \"%s\"\n", join '","', map { join '","', grep {!/^$/} split /\Q$separator\E/, $_ }
                                            @$words;

    return 0;
}
