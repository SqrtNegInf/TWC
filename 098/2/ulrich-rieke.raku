#!/usr/bin/env raku

sub MAIN( Int $N = 3) {
  my @N = <1 2 3 4>;
  my $index ;
  my %numhash ;
  for @N -> $num {
      %numhash{ $num }++ ;
  }
  if ( %numhash{$N}:exists ) {
      my $i = -1 ;
      repeat {
    $i++ ;
      } until ( @N[ $i ] == $N ) ;
      $index = $i ;
  }
  else {
      $index = @N.grep( { $_ < $N } ).elems ;
  }
  say $index ;
}
