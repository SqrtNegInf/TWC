#!/usr/bin/env raku


my $line = '2 6 3 1';
my @numbers = $line.split( /\s/ ).map( {.Int} ) ;
my $maximum = @numbers.max ;
my $retval ;
for @numbers -> $n {
  if ( $maximum != $n && $maximum < 2 * $n ) {
      $retval = -1 ;
      last ;
  }
}
unless $retval {
  $retval = 1 ;
}
say $retval ;
