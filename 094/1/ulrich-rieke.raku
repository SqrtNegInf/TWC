#!/usr/bin/env raku

say "enter a number of words!";
my $S = 'opt bat saw tab pot top was';
my @S = $S.split( /\s/ ) ;
my %anagrams ;
if ( @S.elems == 1 ) {
  say "[ (@S[0]) ]" ;
}
else {
  while ( @S ) {
      my $word = @S.shift ;
      my $reordered = $word.comb.sort.join ;
      %anagrams{$reordered}.push( $word ) ;
  }
  print "[" ;
  for %anagrams.values.sort -> $value {
      print "($value.join( ", ")),\n" ;
  }
  print "]\n" ;
}
