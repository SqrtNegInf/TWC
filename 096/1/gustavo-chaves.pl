#!/usr/bin/env perl

# https://perlweeklychallenge.org/blog/perl-weekly-challenge-096/
# TASK #1 › Reverse Words

use 5.030;
use warnings;

my $S = 'The Weekly Challenge';

local $, = ' ';

say reverse grep {length} split ' ', $S;
