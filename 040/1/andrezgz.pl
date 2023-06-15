#!/usr/bin/env perl
use v5.36;

my @arrays = (
    [qw/ I L O V E Y O U /],
    [qw/ 2 4 0 3 2 0 1 9 /],
    [qw/ ! ? £ $ % ^ & * /]
);

my $max=0;
for (@arrays) {
    $max = $_->@* if ($_->@* > $max);
}

for my $i (0.. $max - 1) {
    print $_->[$i].' ' for @arrays;
    print $/;
}
