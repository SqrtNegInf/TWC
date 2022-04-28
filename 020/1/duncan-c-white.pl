#!/usr/bin/env perl
#
# 
# Challenge 1: "Write a script to accept a string from command line and
# split it on change of character. For example, if the string is "ABBCDEEF",
# then it should split like 'A', 'BB', 'C', 'D', 'EE', 'F'."
# 
# My notes: Clearly defined, sounds like a job for regexes.
# 

use strict;
use warnings;

my $str = 'bookkeeper';

while( $str =~ s/^(([A-Za-z])\2*)// ) { print "$1\n"; }
