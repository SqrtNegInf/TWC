#!/usr/bin/env perl
use v5.36;

my $row1 = "qwertyuiop" ;
my $row2 = "asdfghjkl" ;
my $row3 = "zxcvbnm" ;
my @words = <Hello Alaska Dad Peace>;
my @output ;
for my $word ( @words ) {
  my @letters = split // , lc $word ;
  my $len = scalar( @letters ) ;
  if ( scalar ( grep { index( $row1 , $_ ) != -1 } @letters ) == $len ||
    scalar( grep { index( $row2 , $_ ) != -1 } @letters ) == $len ||
    scalar( grep { index( $row3 , $_ ) != -1 } @letters ) == $len ) {
      push @output, $word ;
  }
}
if ( @output ) {
  print "(" ;
  print join ',' , @output ;
  say ")" ;
}
else {
  say "()" ;
}
