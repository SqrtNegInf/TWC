#!/usr/bin/env raku

# ???

my @list = split /<[, ]>+/, join(',', <1 2 3 4 9 10 14 15 16>); # Accept commas or spaces

my @delta = @list.rotate »-« @list;

@delta.say;
