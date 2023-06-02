#!/usr/bin/env perl
use v5.36;

my $str = $ARGV[0] // "Markmið lífs okkar er að vera hamingjusöm";
my @words = split /\s+/, $str;
say length join "", @words[1 .. $#words -1];
