#!/usr/bin/env raku

sub findSmaller( Int $a , Int $b --> Int ) {
  if ( $a > $b ) {
      return $b ;
  }
  else {
      return $a ;
  }
}

my @array = (2,1,4,1,2,5);
my $drops = 0 ;
my $oldMax ; #for a local number bigger than its right neighbour
my $oldMaxIndex ; #index of $oldMax in @array
my $newMax ; #for a local number bigger than its left neighbour
my $newMaxIndex ; #index of $newMax in @array
my $currentIndex = 0 ;
my $len = @array.elems ;
while ( $currentIndex < $len - 1) {
  if ( @array[$currentIndex + 1] < @array[$currentIndex] ) {
      $oldMax = @array[ $currentIndex ] ;
      $oldMaxIndex = $currentIndex ;
  }
  if ( @array[ $currentIndex + 1 ] > @array[ $currentIndex ] ) {
      $newMax = @array[ $currentIndex + 1 ] ;
      $newMaxIndex = $currentIndex + 1 ;
      my $smaller = findSmaller( $oldMax, $newMax ) ;
      @array[ $oldMaxIndex + 1 .. $newMaxIndex - 1].map: { $drops +=
    $smaller - $_ ; $_ = $smaller } ;
  }
  $currentIndex++ ;
}
say $drops ;
