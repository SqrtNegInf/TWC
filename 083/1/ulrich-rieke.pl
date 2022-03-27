#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my $S = "Markmið lífs okkar er að vera hamingjusöm";
my @words = split /\s+/ , $S ;
my $innerlength = 0 ;
map { $innerlength += length $_ } @words[1 .. $#words - 1] ;
say $innerlength ;
