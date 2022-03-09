#!/usr/bin/env perl

use v5.16;
use strict;

use Algorithm::Combinatorics qw(permutations);
use List::MoreUtils qw(singleton);

my @s = singleton(
  qw(
    PELR PREL PERL PRLE PLER PLRE EPRL EPLR
    ERPL ERLP ELPR ELRP RPEL RPLE REPL RELP 
    RLPE RLEP LPER LPRE LEPR LRPE LREP
  ),
  map{join '',@$_} permutations([split(//,'PERL')])
);

say "Missing permutation(s): (",join(',',@s),")";

