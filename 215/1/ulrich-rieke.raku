#!/usr/bin/env raku

sub is_sorted( $aWord ) {
  my $sorted = $aWord.comb.sort.join ;
  return $sorted eq $aWord ;
}

my @words = ('abc', 'xyz', 'tsu');
say @words.grep( { not ( is_sorted( $_ ) ) } ).elems ;
