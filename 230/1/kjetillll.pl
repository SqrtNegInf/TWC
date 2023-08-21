#!/usr/bin/env perl
use v5.36;

sub digits { "@_" =~ /\d/g }

my @input = @ARGV ? @ARGV : (1,24,51,60);
my @output = digits(@input);
print "@output\n";
