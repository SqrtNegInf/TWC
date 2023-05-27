#!/usr/bin/env perl
use v5.36;

#
# Read in the data, split into fields, add the fields to a set strings,
# placed in an array @;. Add commas after each field.
#
map {$- = 0; $; [$- ++] .= "$_," for /[^,\n]+/g} <DATA>;

#
# Remove trailing commas, print lines.
#
chop, say for @;

__END__
name,age,sex
Mohammad,45,m
Joe,20,m
Julie,35,f
Cristina,10,f
