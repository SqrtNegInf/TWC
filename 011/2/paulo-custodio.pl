#!/usr/bin/env perl
use v5.36;

my $size = shift || 5;
my @i;
for my $r (0..$size-1) {
    for my $c (0..$size-1) {
        $i[$r][$c] = ($r==$c) ? 1 : 0;
    }
}

# print matrix
say "[", join(",\n ", map {"[".join(", ", @{$i[$_]})."]"} 0..$size-1), "]";
