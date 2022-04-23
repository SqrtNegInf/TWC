#!/usr/bin/env perl

use v5.12;
use warnings;
use PDL;
use PDL::NiceSlice;
my $input=pdl( (1, 3, 5, 7, 9) );
my $result="-1 as no equilibrium index was found"; # default output
say "Input: ", $input;
for(1..$input->nelem-2){ #for all internal indices
   $result="$_ as sum(".$input(0:$_-1).")==sum(".$input($_+1:-1).")", last
   if $input(0:$_-1)->sumover==$input($_+1:-1)->sumover; # Found equilibrium
}
say "Output: $result";
