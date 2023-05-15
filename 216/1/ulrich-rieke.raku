#!/usr/bin/env raku

my @words = ('abc', 'abcd', 'bcd');
my $registration = 'AB1 2CD';
my $comp = set($registration.lc.comb.grep( { $_ ~~ / <alpha> / } ))  ;
my @selected = @words.grep( { $comp (<=) set( $_.comb) } ) ;
say "(" ~ @selected.join( ',' ) ~ ")" ;
