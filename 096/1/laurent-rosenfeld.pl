#!/usr/bin/env perl
use v5.36;

my $input = shift // "    Perl and   Raku are  part of the same family  ";
say join " ", reverse split /\s+/, $input;
