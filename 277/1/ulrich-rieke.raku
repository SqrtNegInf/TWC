#!/usr/bin/env raku

my $firstLine = 'my red dog';
my @firstWords = $firstLine.words ;
my $secondLine = 'red flag warning';
my @secondWords = $secondLine.words ;
my $common = @firstWords.Set (&) @secondWords.Set ;
my %firstFreq ;
my %secondFreq ;
@firstWords.map( {%firstFreq{$_}++} ) ;
@secondWords.map( {%secondFreq{$_}++} ) ;
say $common.keys.grep( {%firstFreq{$_} == 1 && %secondFreq{$_} == 1 } ).
elems ;
