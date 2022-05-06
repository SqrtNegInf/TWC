#!/usr/bin/env raku

my @STRINGS-TO-RANK = <3 8 1 3 6>;
say dense @STRINGS-TO-RANK;
say modified @STRINGS-TO-RANK;
say standard @STRINGS-TO-RANK;

sub standard(@a) { @a.sort.antipairs.classify({ $_.key }).values.map(*.min).sort({ $_.key }) }

sub modified(@a) { @a.sort.antipairs.classify({ $_.key }).values.map(*.max).sort({ $_.key }) }

sub dense(@a) { @a.Set.keys.sort.antipairs }
