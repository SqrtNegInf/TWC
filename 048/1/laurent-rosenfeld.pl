#!/usr/bin/env perl
use v5.36;

my $number = shift // 50;

my @persons = 1 .. $number;
for (1.. $number - 1) {
    push @persons, shift @persons;
    shift @persons;
}
say "Person @persons is the survivor.\n";
