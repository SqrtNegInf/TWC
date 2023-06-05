#!/usr/bin/env perl

# ------------------------------------------------------------------------------------------------------------
# PRELIMINARIES:
use v5.36;
use strict;
use warnings;
use utf8;
use Sys::Binmode;
use Time::HiRes 'time';
$"=', ';

# ------------------------------------------------------------------------------------------------------------
# DEFAULT INPUTS:
my @arrays =
(
   [-2, -1, 0, 3, 4],
   [5, -4, -1, 3, 6],
);

# ------------------------------------------------------------------------------------------------------------
# NON-DEFAULT INPUTS:
if (@ARGV) {@arrays = eval($ARGV[0]);}

# ------------------------------------------------------------------------------------------------------------
# MAIN BODY OF PROGRAM:
my $t0 = time;
for my $aref (@arrays) {
   my @squares = sort {$a<=>$b} map {$_*$_} @$aref;
   say '';
   say "array   = (@$aref)";
   say "squares = (@squares)";
}
#my $µs = 1000000 * (time - $t0);
#printf("\nExecution time was %.3fµs.\n", $µs);
