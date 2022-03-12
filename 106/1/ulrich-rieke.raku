#!/usr/bin/env raku

sub createPairs( @numbers ) {
  my $len = @numbers.elems ;
  my @pairs ;
  for (0 .. $len - 2 ) -> $i {
      @pairs.push([@numbers[ $i ] , @numbers[ $i + 1 ]] ) ;
  }
  return @pairs ;
}

my $line = <1 3 8 2 0>;
my @numbers = $line.split(/\s+/).map( {$_.Int} ) ;
if ( @numbers.elems == 1 ) {
  say 0 ;
  exit( 0 ) ;
}
else {
  my @sorted = @numbers.sort( {$^b <=> $^a} ) ;
  my @neighbours = createPairs( @sorted ) ;
  say @neighbours.map( {$_[0] - $_[1]} ).sort( {$^b <=> $^a} )[0] ;
}
