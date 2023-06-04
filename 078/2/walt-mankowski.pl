#!/usr/bin/env perl
use v5.36;

my @a = (10,20,30,40,50); my @b = (3,4);

for my $b (@b) {
    local $, = " ";
    say rotate_by($b, @a);
}

sub rotate_by($b, @a) {
    return (@a[$b..$#a], @a[0..$b-1]);
}
