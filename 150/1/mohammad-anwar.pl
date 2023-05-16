#!/usr/bin/env perl
use v5.36;

use Test::More;

is(fibonacci_words('1234', '5678', 51), 7, 'Example');

done_testing;

#
#
# METHOD

sub fibonacci_words {
    my ($term_1, $term_2, $index) = @_;

    while (length($term_1 . $term_2) <= $index) {
        ($term_1, $term_2) = ($term_2, $term_1 . $term_2);
    }

    return substr($term_1 . $term_2, --$index, 1);
}
