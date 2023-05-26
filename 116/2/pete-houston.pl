#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';

my $root = sqrt sum map { $_ * $_ } split //, 34;
print $root == int $root ? "1\n" : "0\n";
