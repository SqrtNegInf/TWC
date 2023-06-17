#!/usr/bin/env perl
use v5.36;

for my $file ( '../00-blogs') {

    # -f $file => Does file exits
    # open fails is file is unreadable
    if ( -f $file && open my $fh, '<', $file ) {
        my %hash ;

        # turn the multiline array from the filehandle
        # into a string
        my $text = join '', <$fh> ;

        # split the string into characters, use lc to make them
        # all lowercase, and remove non-lowercase-letters
        my @text = grep { /[a-z]/ } map { lc } split //, $text ;

        # count each letter
        for my $l ( @text ) { $hash{ $l }++ }

        # and we go through each letter, and print the value
        # or zero, if there isn't a value
        say $file;
        say '=' x length $file ;
        for my $l ( 'a' .. 'z' ) {
            say join ': ', $l, $hash{ $l } || 0 ;
            }
        say '' ;
        }
    }
