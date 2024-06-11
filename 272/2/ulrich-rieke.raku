#!/usr/bin/env raku

my $word = 'perl';
my @numbers = $word.comb.map( {.ord} ) ;
my $sum = 0 ;
for @numbers.rotor( 2 => -1 ) -> $seq {
   my $diff = ($seq[0] - $seq[1]).abs ;
   $sum += $diff ;
}
say $sum ;
