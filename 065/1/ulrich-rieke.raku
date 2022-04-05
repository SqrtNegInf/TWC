#!/usr/bin/env raku

sub digitSum( Int $n is copy ) {
  return [+] $n.comb.map( {.Int} ) ;
}

sub MAIN( Int $N = 2 , Int $S = 10 ) {
  my $lowest = ("1" ~ "0" x ( $N - 1 )).Int ;
  my $highest = ("1" ~ "0" x $N).Int ;
  .say for ($lowest...^$highest).grep( { digitSum( $_ ) == $S } ) ;
}
