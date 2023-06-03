#!/usr/bin/env perl
use v5.36;

use List::Util qw/sum/;

my $N = $ARGV[0] // 4;

die '$N must be a positive integer' unless $N > 0 && int($N) == $N;

say sum(split("", join("", map { sprintf('%b', $_) } 1 .. $N))) % 1000000007;
