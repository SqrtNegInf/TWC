#!/usr/bin/env perl
use v5.36;

my $S = 'Markmið lífs okkar er að vera hamingjusöm';;
my @W = split /\s+/, $S; # convert into words
die 'must be 3 or more words' unless @W >= 3; # check that it's long enough
shift @W; # drop the first word
pop @W; # drop the last word
my $length = length(join '', @W); # the length of the rest

say $length;
