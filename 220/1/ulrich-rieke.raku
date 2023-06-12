#!/usr/bin/env raku

my $line = 'love live leave';
my @words = $line.words.map( {$_.lc} ) ;
my @wordSets = @words.map( { $_.comb.Set } ) ;
my $intersection = [(&)] @wordSets ;
say "(" ~ $intersection.keys.sort ~ ")" ;
