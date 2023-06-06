#!/usr/bin/env perl
use v5.36;

use lib ".";
use FNR qw(firstNonRepeat);

my $S = 'ababcabd';

die "Need a string" unless $S;

say firstNonRepeat($S);
