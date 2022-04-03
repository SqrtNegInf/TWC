#!/usr/bin/env raku

sub swapLetters( Str $word is copy , Int $firstPos, Int $secondPos --> Str) {
  my $temp = $word.substr( $secondPos , 1 ) ;
  $word.substr-rw( $secondPos , 1 ) = $word.substr( $firstPos , 1 ) ;
  $word.substr-rw( $firstPos , 1 ) = $temp ;
  return $word ;
}

sub MAIN( Str $word is copy='perlandraku', Int $C =3 , Int $O =4) {
  my $len = $word.chars ;
  for (1..$C) -> $i {
      $word = swapLetters( $word , $i % $len , ( $i + $O ) % $len ) ;
  }
  $word.say ;
}
