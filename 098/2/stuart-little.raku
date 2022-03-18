#!/usr/bin/env raku
use v6;

# run <script> <target> <space-separated array entries>

my @nrs = <3 1 2 3 4>.map(*.Int);
say @nrs[1..*].grep(* < @nrs[0]).elems
