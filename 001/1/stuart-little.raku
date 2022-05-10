#!/usr/bin/env raku
use v6;

sub tr_es($s) { my $trs = S:g/e/E/ with $s; $trs, $/.elems }

say tr_es( @*ARGS[0] || 'Perl Weekly Challenge' )
