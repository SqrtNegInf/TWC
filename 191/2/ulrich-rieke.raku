#!/usr/bin/env raku

sub createPairs( $seq ) {
  my @pairs ;
  my $num = 1 ;
  for ( 0 .. $seq.elems - 1 ) -> $i {
      @pairs.push( [$num , $seq[ $i ]] ) ;
      $num++ ;
  }
  return @pairs ;
}

sub isCute( @array ) {
  my $len = @array.elems ;
  return @array.grep( {($_[0] %% $_[1]) || ($_[1] %% $_[0] ) } ).elems == $len ;
}

my $number = 8;
my $count = 0 ;
for (1..$number).permutations -> $aSeq {
  my @pairs = createPairs( $aSeq ) ;
  if ( isCute( @pairs ) ) {
      $count++ ;
  }
}
say $count ;
