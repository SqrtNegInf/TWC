#!/usr/bin/env raku

my @numbers = (2,5,8,1);
  my @sorted = @numbers.sort( { $^a <=> $^b } ) ;
  my $len = @sorted.elems ;
  my @differences ;
  for ( 0..$len - 2 ) -> $i {
      @differences.push( @sorted[ $i + 1 ] - @sorted[ $i ] ) ;
  }
  my $maxdiff = @differences.max ;
  my $count = 0 ;
  for @differences -> $diff {
      if ( $diff == $maxdiff ) {
    $count++ ;
      }
  }
  $count.say ;
