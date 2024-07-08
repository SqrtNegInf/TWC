#!/usr/bin/env perl
use v5.36;

my @ARGV = (12, 12, 30, 24, 24);
my @counts;
$counts[$_%24]++ for @ARGV;
my $Npairs;
$Npairs += ($counts[$_]//0)*($counts[(-$_)%24]//0) for 1..11;
$Npairs += ($counts[$_]//0)*(($counts[$_]//0)-1)/2 for(0,12);
say "@ARGV -> $Npairs";
