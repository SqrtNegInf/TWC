#!/usr/bin/env raku

sub isSorted ( $aWord is copy ) {
   my $compare = $aWord ;
   return ( $aWord.comb.sort( {$^a cmp $^b} ).join eq $compare || 
	 $aWord.comb.sort( {$^b cmp $^a} ).join eq $compare ) ;
}

my $line = 'abc bce cae';
say $line.words.grep( {not isSorted( $_ )} ).elems ;
