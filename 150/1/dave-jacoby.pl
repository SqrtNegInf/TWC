#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use List::Util qw{ sum0 max };

say fibonacci_words( '1234', '5678' );

sub fibonacci_words ( $word1, $word2 ) {
    my @words;
    push @words, $word1, $word2;
    while ( length $words[-1] < 51 ) {
        my $w = $words[-2] . $words[-1];
        push @words, $w;
    }
    my $last = pop @words;
    # zero indexing leads to possible fencepost error
    return substr $last, 50, 1;
}
