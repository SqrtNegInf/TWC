#!/usr/bin/env perl
use v5.36;

my @ints = (10, 1, 111, 24, 1000);
even_digits_number(\@ints);

@ints = (111, 1, 11111);
even_digits_number(\@ints);

@ints = (2, 8, 1024, 256);
even_digits_number(\@ints);

sub even_digits_number {
    my $ints = shift || [];

    printf "(%s) -> %s\n",
        (join ', ', @$ints ),
        scalar map { (length $_) % 2 ? () : 1 }
                 @$ints;

    return undef;
}
