#!/usr/bin/env perl5.32.1

use v5.12;
use warnings;
use PDL;
my $in=pdl(<1 2 3 10>);
my $n=$in->uniq; # filter out repeated elements
my $r=where($n&$n->dummy(0), $n^$n->dummy(0))->sum/2;
say "Input: $in Output: $r";
