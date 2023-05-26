#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use List::Util qw(sum);

my $verbose = 0;

GetOptions("verbose" => \$verbose);

my $N = 34;

die "Specify a positive integer with at least two digits"
  unless $N =~ /^[1-9]\d+$/;

my @N       = split(//, $N);
my @squares = map { $_ ** 2 } @N;
my $sum     = sum(@squares);
my $root    = sqrt($sum);

if ($verbose)
{
  say ": Squares: @squares";
  say ": Sum: $sum";
  say ": Root: $root";
}

say int($root) == $root ? 1 : 0;
