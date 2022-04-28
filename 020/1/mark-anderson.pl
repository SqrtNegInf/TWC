#!/usr/bin/env perl

use Modern::Perl '2018';

my $string = 'bookkeeper';
my @array;

while($string =~ /((.)\2*)/g) {
    push @array, $1;
}

say "@array";
