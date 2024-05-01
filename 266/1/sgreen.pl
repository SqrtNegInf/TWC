#!/usr/bin/env perl
use v5.36;

sub main (@strings) {
    my %freq = ();

    # Compute the frequency of each word
    foreach my $string (@strings) {
        foreach my $word ( split / /, $string ) {
            ++$freq{$word};
        }
    }

    # Return the word(s) that appear only once.
    my @match = grep { $freq{$_} == 1 } keys %freq;
    if ( scalar(@match) == 0 ) {
        # If there is no result, show an empty string
        say "('')";
    }
    else {
        say "('", join( "', '", @match ), "')";
    }
}

main(@ARGV);
