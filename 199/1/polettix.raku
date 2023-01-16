#!/usr/bin/env raku

sub MAIN (*@args) { put good-pairs(@args ?? @args !! (1, 2, 3, 1, 1, 3))}
sub good-pairs (*@list) { my %c; @list.map({%c{$_}++}).sum }
