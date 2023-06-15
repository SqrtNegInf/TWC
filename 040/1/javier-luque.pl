#!/usr/bin/env perl
use v5.36;

my $arrays = [
    [ qw (I L O V E Y O U) ],
    [ qw (2 4 0 3 2 0 1 9) ],
    [ qw (! ? £ $ % ^ & *) ],
];

# Sizes of the array
my @sizes =
    sort { $b <=> $a }
    map { scalar(@$_) } @$arrays;

# Loop through each array
for my $i (0 .. $sizes[0] - 1) {
    say join ' ',
        map { $_->[$i] // ' ' }
        @$arrays;
}
