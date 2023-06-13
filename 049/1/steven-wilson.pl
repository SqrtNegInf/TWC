#!/usr/bin/env perl
use v5.36;

my $number     = 55;
my $mulitplier = 1;
my $smallest_multiple;

while (1) {
    my $mulitple = $mulitplier * $number;
    if ( $mulitple =~ /^[01]*$/ ) {
        $smallest_multiple = $mulitple;
        last;
    }
    $mulitplier++;
}

say $smallest_multiple;
