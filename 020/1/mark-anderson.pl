#!/usr/bin/env perl
use v5.36;

my $string = 'bookkeeper';
my @array;

while($string =~ /((.)\2*)/g) {
    push @array, $1;
}

say "@array";
