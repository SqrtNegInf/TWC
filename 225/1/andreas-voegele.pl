#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);

sub max_words (@sentences) {
    return max 0, map { scalar split } @sentences;
}

say max_words(
    'Perl and Raku belong to the same family.',
    'I love Perl.',
    'The Perl and Raku Conference.'
);

say max_words(
    'The Weekly Challenge.',
    'Kotlin is the most interesting guest language.',
    'Team PWC has over 300 members.'
);
