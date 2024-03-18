#!/usr/bin/env raku

my $word = 'CAT';
my %permuHash ;
for $word.comb.permutations -> $permu {
   %permuHash{ $permu.join( '' )}++ ;
}
my @sorted = %permuHash.keys.sort ;
my $pos = 0 ;
repeat {
   $pos++ ;
} until ( @sorted[ $pos - 1] eq $word ) ;
say $pos ;
