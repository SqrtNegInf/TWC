#!/usr/bin/env perl
use v5.36;

use List::Util 'max';

sub main (@sentences) {
    # Count the number of spaces + 1
    my @words = map { tr/ / / + 1 } @sentences;

    # Display the maximum number of words
    say max(@words);
}

my @S =("Perl and Raku belong to the same family.",
           "I love Perl.",
           "The Perl and Raku Conference.");
main(@S);
