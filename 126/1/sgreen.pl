#!/usr/bin/env perl
use v5.36;

sub main {
    my $N = shift   // 200;

    # Sanity check
    die "You must supply a postive integer" unless defined $N;
    die "The value '$N' is not a positive integer\n" unless $N =~ /^[1-9][0-9]*$/;

    # Count the number of numbers that don't have a one
    my $count = 0;
    foreach my $number ( 2 .. $N ) {
        ++$count if index( $number, '1' ) == -1;
    }

    # Display the result
    say $count;
}

main(@ARGV);
