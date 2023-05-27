#!/usr/bin/env perl
use v5.36;

use List::Util 'max';

sub main {
    my $filename = 'example.csv';
    die "File does not exist or is not readable\n" unless -f $filename && -r $filename;

    # Open the file
    open( my $fh, '<', $filename ) or die "Cannot open $filename: $!";

    # Read the input into an array
    my @lines = ();
    while ( my $line = <$fh> ) {
        # Remove the trailing cr/nl characters
        chomp $line;
        push @lines, [ split /,/, $line ];
    }

    # Get the maximum number of values in the rows
    my $max = max( map { scalar(@$_) } @lines );

    # Print each column as a row
    for my $col ( 0 .. $max - 1 ) {
        say join ',', map { $_->[$col] // '' } @lines;
    }
}

main();
