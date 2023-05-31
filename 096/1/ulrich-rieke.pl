#!/usr/bin/env perl
use v5.36;

my $S = 'The Weekly Challenge';
$S =~ s/^\s*?// ;
$S =~ s/s+$// ;
my @words = split( /\s+/ , $S ) ;
say join( ' ', reverse @words ) ;
