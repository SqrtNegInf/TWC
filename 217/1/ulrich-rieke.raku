#!/usr/bin/env raku

#say "Enter a square matrix of n x n elements, n >= 2 , end to end!" ;
#my @allNumbers ;
#my $line = $*IN.get ;
#while ( $line ne "end" ) {
#  my @numbers = $line.words ;
#  for @numbers -> $num {
#      @allNumbers.push( +$num ) ;
#  }
#  $line = $*IN.get ;
#}

my @A = ([3, 1, 2], [5, 2, 4], [0, 1, 3]);
my @sorted = @A.sort( { $^a <=> $^b } ) ;
say @sorted[ 2 ] ;
