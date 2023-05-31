#!/usr/bin/env perl
use v5.36;

$_ = 'The Weekly Challenge';
s/\s+/ /g ; 
s/^\s+//g;
s/\s+$//g;
my @a = reverse split / /, $_; 
print "'";
print join " ", @a;
print "'" ;
print "\n";
