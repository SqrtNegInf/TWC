#!/usr/bin/env perl

use v5.28;
use strict;
use warnings;

use Data::Dump qw(dump);

my @examples_l = (
    [ 'perl', 'c', 'python' ],
    [ 'c++', 'haskell', 'java' ],
);

my @examples_p = (
    [ 2, 1, 3 ],
    [ 1, 3, 2 ],
);

sub sort_languages {
    my ($languages, $popularity) = @_;
    my $length = scalar @$languages - 1;
    my @sorted;

    for (my $index = 0; $index <= $length; $index++) {
        $sorted[$popularity->[$index]] = $languages->[$index];
    }

    shift @sorted;
    
    return \@sorted;
}

for (my $index = 0; $index <= $#examples_l ; $index++) {
    my $langs = $examples_l[$index];
    my $popularity = $examples_p[$index];

    my $sorted = sort_languages $langs, $popularity;

    say 'Input : @lang = ', dump(@$langs);
    say '        @popularity = ', dump(@$popularity);
    say 'Output : ', dump(@$sorted);
    say ' ';
}
