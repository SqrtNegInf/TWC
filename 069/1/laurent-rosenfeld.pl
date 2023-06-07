#!/usr/bin/env perl
use v5.36;

for my $k (1..200) {
    next unless $k =~ /^[0689]+$/;
    my $i = reverse $k;
    $i =~ tr/69/96/;
    say $k if $i eq $k;
}
