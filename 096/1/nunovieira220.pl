#!/usr/bin/env perl
use v5.36;

# Input
my $S = "    Perl and   Raku are  part of the same family  ";

# Reverse Words
$S =~ s/^\s+|\s+$//g;
$S =~ s/\s+/ /g;

my $res = join(" ", reverse(split(" ", $S)));

# Output
say($res);
