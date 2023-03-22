#!/usr/bin/env raku

sub findIndex( @array , $word ) {
  my $pos = 0 ;
  while ( @array[ $pos ] ne $word ) {
      $pos++ ;
  }
  return $pos ;
}


my @firstWords = <Perl Raku Love>; 

my $firstSet = set( @firstWords ) ;

my @secondWords = <Raku Perl Hate>;
my $secondSet = set( @secondWords ) ;

my $common = $firstSet (&) $secondSet ;
if ( $common.elems > 0 ) {
  my @indexlist ;
  for $common.keys -> $aWord {
      @indexlist.push( [$aWord , findIndex( @firstWords, $aWord ) + findIndex( @secondWords ,
          $aWord ) ] ) ;
  }
  my @sorted = @indexlist.sort( {$^a[1] <=> $^b[1] } ) ;
  my @allWords ;
  my $minimum = @sorted[0][1] ;
  for @sorted -> $pair {
      if ( $pair[ 1 ] == $minimum ) {
    @allWords.push( $pair[ 0 ] ) ;
      }
  }
  print "(" ;
  print join( ',' , @allWords.sort ) ;
  say ")" ;
}
else {
  say "( ) " ;
}
