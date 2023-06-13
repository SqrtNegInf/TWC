#!/usr/bin/env perl
use v5.36;

my @person = 1..50;
my $i = 0;
while (@person > 1) {
    my $j = ($i + 1) % @person;
    splice(@person, $j, 1);
    $i = ($i + 1) % @person;
}

say "The survivor is @person";
