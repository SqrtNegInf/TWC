#!/usr/bin/env raku

sub MAIN( Str $S  = 'Markmið lífs okkar er að vera hamingjusöm') {
  my @words = $S.words ;
  my $arraylen = @words.elems ;
  my $stringlen = 0 ;
  @words[1..$arraylen - 2].map( {$stringlen += $_.chars } ) ;
  say $stringlen ;
}
