#!/usr/bin/env perl
use v5.36;

my $doors = shift || 500;

# Justification: http://www.ry.ca/2020/02/500-doors/
say join ' ', map { $_ * $_ } 1..int sqrt $doors;


# That's fine, I can do it the hard way:
my %door;
for my $m (1..$doors) {
    $door{$m*$_} ^= 1 for 1..$doors/$m;
}
say join ' ', grep { $door{$_} }
              sort { $a <=> $b } keys %door;

