#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vara /;

use List::Util 'min';

sub levenshtein {
    my ($from, $to) = @_;
    my $fromLength = length $from;
    my $toLength = length $to;

    if ($toLength == 0) {
        return $fromLength;
    }
 
    if ($fromLength == 0) {
        return $toLength;
    }

    my $fromTail = substr($from, 1, $fromLength - 1);
    my $toTail = substr($to, 1, $toLength - 1);

    if (substr($from, 0, 1) eq substr($to, 0, 1)) {
        return levenshtein($fromTail, $toTail);
    }

    return 1 + min(
        levenshtein($from, $toTail), # Insert
        levenshtein($fromTail, $to), # Remove
        levenshtein($fromTail, $toTail) # Replace
    );
}

#if (scalar @ARGV < 2) { usage(); }

say levenshtein( 'kitten', 'sitting' );
