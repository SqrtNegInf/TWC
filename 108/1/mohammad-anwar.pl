#!/usr/bin/env perl
use v5.36;

my $n = 1;
\$n =~ /SCALAR\((.*)\)/ and print "$1\n";
