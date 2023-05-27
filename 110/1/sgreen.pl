#!/usr/bin/env perl
use v5.36;

sub main {
    my $filename = 'phone-numbers.txt';
    die "File does not exist or is not readable\n" unless -f $filename && -r $filename;

    # Open the file
    open( my $fh, '<', $filename ) or die "Cannot open $filename: $!";

    while ( my $line = <$fh> ) {
        # Remove the trailing cr/nl characters
        chomp $line;

        # Print the line if it is the correct format
        say $line if $line =~ /^(?:\+[0-9]{2}|\([0-9]{2}\)|[0-9]{4}) [0-9]{10}$/;
    }
}

main(@ARGV);
