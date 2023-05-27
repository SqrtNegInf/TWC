#!/usr/bin/env perl
use v5.36;

my @rows = map { chomp; [ split ',' ] } <DATA>;

for my $col (0..$#{$rows[0]}) {
    say join ',', map { $_->[$col] } @rows
}

__END__
name,age,sex
Mohammad,45,m
Joe,20,m
Julie,35,f
Cristina,10,f
