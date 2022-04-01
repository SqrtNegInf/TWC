#!/usr/bin/env perl
use strict;
use feature 'say';

my $N   = $ARGV[0] || 90;

for (2..$N/2) {
    (1x$_) !~ /^1?$|^(11+?)\1+$/ && (1x($N - $_)) !~ /^1?$|^(11+?)\1+$/ && say "$_ + ".($N - $_)." = $N";
}
