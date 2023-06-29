#!/usr/bin/env perl
use v5.36;

my $str = 'Perl Weekly Challenge';

my $c = ($str =~ tr/e/E/);

print $str . ' had ' . $c . ' e\'s that were replaced by E\'s';
