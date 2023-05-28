#!/usr/bin/env perl
use v5.36;

use Data::Dumper;

die "Usage: locate-memory val\n" unless @ARGV==1;

my $x = shift;
my $refx = \$x;
printf "address of $x is %p\n", $refx;
