#!/usr/bin/env perl
use strict;
use warnings;
use feature "say";

my $str = $ARGV[0] // "Markmið lífs okkar er að vera hamingjusöm";
my @words = split /\s+/, $str;
say length join "", @words[1 .. $#words -1];
