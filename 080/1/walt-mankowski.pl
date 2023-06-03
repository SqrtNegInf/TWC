#!/usr/bin/env perl
use v5.36;

my %n = map { $_ => 1 } @ARGV;

my $i = 1;
while (1) {
    if (defined $n{$i}) {
        $i++;
    } else {
        say $i;
        last;
    }
}
