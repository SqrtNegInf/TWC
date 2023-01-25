#!/usr/bin/env perl

use v5.36;
my @truth=qw(012345 12 01346 01236 1256 02356 023456 012 0123456 01256); #0-6 instead of a-g
# Binary masks for each segment
my @masks=(558551906910208, 34628173824, 16512, 127, 1056768, 2216203124736, 266338304);
for(<1234 200>){ # for each number
    my @lines=('')x7;
    for(split '', $_){ # for each digit
        my $code=0;
        $code|=$masks[$_] for split "", $truth[$_];
        my @bin=split "", sprintf "%049b", $code; # As binary array
        my @bits=map {my $x=$_; [map{!$_?" ":$x%3?"|":"-"} @bin[7*$_..7*$_+6]]} (0..6);
        $lines[$_].="  ". join "", @{$bits[$_]} for (0..6);
    }
    say $_ for @lines;
}
