#!/usr/bin/env perl

use strict;

my $str = 'Perl Weekly Challenge';

my $c = ($str =~ tr/e/E/);

print $str . ' had ' . $c . ' e\'s that were replaced by E\'s';
