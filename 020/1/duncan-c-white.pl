#!/usr/bin/env perl
use v5.36;

my $str = 'bookkeeper';

while( $str =~ s/^(([A-Za-z])\2*)// ) { print "$1\n"; }
