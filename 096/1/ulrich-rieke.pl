#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my $S = 'The Weekly Challenge';
$S =~ s/^\s*?// ;
$S =~ s/s+$// ;
my @words = split( /\s+/ , $S ) ;
say join( ' ', reverse @words ) ;
