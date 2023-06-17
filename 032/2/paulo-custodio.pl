#!/usr/bin/env perl
use v5.36;

use List::Util 'max';

my $data = { apple => 3, cherry => 2, banana => 1 };

sub chart {
    my($data) = @_;

    # get size of keys
    my $width = max(map {length($_)} keys %$data);

    # output data
    for my $key (sort keys %$data) {
        say sprintf("%*s | %s", $width, $key, "##" x $data->{$key});
    }
}

chart($data);
