#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $verbose = 0;

GetOptions("verbose" => \$verbose);

my $N = 99;

die "Specify a positive integer" unless $N =~ /^[1-9]\d*$/;

my $bin = sprintf('%b', $N);

say ": $bin (binary)\n: " . reverse($bin) . " (binary flipped)" if $verbose;

say 0 + ($bin eq reverse($bin));
