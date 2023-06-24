#!/usr/bin/env perl
use v5.36;

my @in = split "", 'RAKU';
my $out = 0;

my $c = 0;
my %map =  map { $_ => $c++ } (0..9,"A".."Y");

my $mult = 1;
for my $char ( reverse @in ) {
    $out += ( $mult * $map{$char} );
    $mult *= 35;
}

say $out;
