#!/usr/bin/env perl
use v5.36;

my @ARGV = <Markmið lífs okkar er að vera hamingjusöm>;

@ARGV >= 3 or die "need at least 3 words\n";
say length(join(' ', @ARGV[1 .. $#ARGV-1]));
