#!/usr/bin/env perl
use v5.36;

use List::Util qw/sum product/;

my @ARGV=(1,3,5,6,9);
my $arith = sum (@ARGV) / @ARGV;
my $geom  = (abs product @ARGV) ** (1 / @ARGV);
my $harm  = @ARGV / sum map { 1 / $_ } @ARGV;

printf "AM = %3.1f, GM = %3.1f, HM = %3.1f\n", $arith, $geom, $harm;
