#!/usr/bin/env perl
use v5.36;

sub main (@words) {
    # The last value is the acronym
    my $acronym = pop(@words);

    # Calculate the first letters from the words
    my $first_letters = join( '', map { substr( $_, 0, 1 ) } @words );
    say lc($first_letters) eq lc($acronym) ? 'true' : 'false';
}

main(("Perl", "Python", "Pascal", 'ppp'));
