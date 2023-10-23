#!/usr/bin/env perl
use v5.36;

use List::Util 'all';

sub main (@words) {
    # The last value is the 'allowed' list
    my $allowed = pop(@words);
    my %allowed = map { $_, 1 } split(//, $allowed);
    my $count = 0;

    # Count the number of words that match this regular expression
    foreach my $word (@words) {
        $count++ if all { exists $allowed{$_} } split(//, $word);
    }

    say $count;
}

main( <ad bd aaab baa badab ab> );
