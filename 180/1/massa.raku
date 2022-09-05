#!/usr/bin/env raku

my regex first-unique { :my %visited; . :my $c = $¢; <!{ %visited{$c}++ }> <!before .* $c> }

('raku Yearly Challenge').map({ $^s ~~ &first-unique ?? $/.pos - 1 !! -1 })».say
