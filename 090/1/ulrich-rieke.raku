#!/usr/bin/env raku

sub MAIN( Str $sequence = 'GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG' ) {
  my %basepairs = ( 'A' => 'T' , 'C' => 'G' , 'G' => 'C' , 'T' => 'A' ) ;
  my $complementary ;
  my %basefreqs ;
  for (0 .. $sequence.chars - 1 ) -> $i {
      my $let = $sequence.substr( $i , 1 ) ;
      %basefreqs{ $let }++ ;
      $complementary ~= %basepairs{ $let } ;
  }
  say "The base frequencies are:" ;
  say "A: { %basefreqs{'A'} }" ;
  say "T: { %basefreqs{'T'} }" ;
  say "G: { %basefreqs{'G'} }" ;
  say "C: { %basefreqs{'C'} }" ;
  say "the complementary sequence is:" ;
  say $complementary ;
}
