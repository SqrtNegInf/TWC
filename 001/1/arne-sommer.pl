#!/usr/bin/env perl
use v5.36;

my $string = $ARGV[0] || 'Perl Weekly Challenge';  # [1]

my $count = $string =~ tr/e/E/;                    # [2]

say "$string (with $count replacements).";         # [3]
