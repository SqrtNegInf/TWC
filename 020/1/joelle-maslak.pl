#!/usr/bin/env perl
use v5.36;

my (@parts) = grep { state $i=1; $i++ % 2 } 'bookkeeper' =~ /((.)\2*)/gms;
say join("\n", @parts);

