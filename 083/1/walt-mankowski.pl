#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);

# TASK #1 › Words Length
# Submitted by: Mohammad S Anwar
#
# You are given a string $S with 3 or more words.
#
# Write a script to find the length of the string except the first and
# last words ignoring whitespace.

my $s = "Markmið lífs okkar er að vera hamingjusöm";
my @s = split / /, $s;

say length(join '', @s[1..$#s-1]);
