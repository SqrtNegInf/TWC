#!/usr/bin/env perl
use v5.36;

my %possibilities = (1 => []);
while (! exists $possibilities{200}) {
    for my $p (keys %possibilities) {
        $possibilities{ $_ } ||= [ @{ $possibilities{$p} }, $p ]
            for $p + 1, $p * 2;
    }
}

my @moves = @{ $possibilities{200} };
say scalar @moves, ": @moves";
