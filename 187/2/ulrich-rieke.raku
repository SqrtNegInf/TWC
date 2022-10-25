#!/usr/bin/env raku

my @numbers = (1, 2, 3, 1, 2, 3, 7, 9, 10, 5, 10);
my @combis = @numbers.combinations( 3 ).Array ;
my @triplets ;
for @combis -> @combi {
  my @permus = @combi.permutations.Array ;
  for @permus -> $tripl {
      @triplets.push( $tripl ) ;
  }
}
@triplets = @triplets.unique(:with(&[eqv])) ;
my $maximum = 0 ;
for @triplets -> @combi {
  if ( @combi.sum > $maximum ) {
      $maximum = @combi.sum ;
  }
}
my @solution = @triplets.grep( { ($_[0] + $_[1] > $_[2]) &&
      ($_[1] + $_[2] > $_[0] ) && ( $_[0] + $_[2] > $_[1] ) &&
      ( $_.sum == $maximum ) } ) ;
if ( @solution.elems > 1 ) {
  @solution = @solution.grep( { ($_[0] >= $_[1]) && ($_[1] >= $_[2])} ) ;
}
say @solution ;
