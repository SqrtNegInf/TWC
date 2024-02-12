#!/usr/bin/env raku

my $firstWord = "Perl"; 
my $secondWord = "Preel";

my %firstFreq ;
my %secondFreq ;
for $firstWord.comb -> $letter {
   %firstFreq{ $letter }++ ;
}
for $secondWord.comb -> $letter {
   %secondFreq{ $letter }++ ;
}
say %secondFreq.keys.grep( { (not %firstFreq{$_}:exists) || %secondFreq{$_} != 
      %firstFreq{$_} } )[0] ;
