#!/usr/bin/env raku

sub concatenate( $aSequence ) {
  my $number = "";
  my $len = $aSequence.elems ;
  for (0..$len - 1 ) -> $n {
      $number ~= $aSequence[ $n ] ;
  }
  return $number.Int ;
}

#say "Enter some numbers, separated by blanks!" ;
#my $line = $*IN.get ;
my @numbers = (31, 2, 4, 10);
my $len = @numbers.elems ;
my $allPermus = @numbers.permutations ;
my @results ;
for (0 .. $allPermus.elems - 1 ) -> $n {
  @results.push( concatenate( $allPermus[ $n ] )) ;
}
say @results.max ;
