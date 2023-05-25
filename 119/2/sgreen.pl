#!/usr/bin/env perl
use v5.36;

my $counter = shift // 60;

# Sanity check
die "You must specify a positive integer\n" unless defined $counter;
die "The value doesn't appear to be a positive integer\n" unless $counter =~ /^[1-9][0-9]*$/;

my $number = 0;
while ( $counter and ++$number ) {
    --$counter if $number =~ /^[123]*$/ and index( $number, '11' ) == -1;
}
say $number;
