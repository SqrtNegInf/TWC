#!/usr/bin/env perl
use v5.36;

use List::Util qw ( sum ) ;

sub condition {
  my $word = shift ;
  my $lettercomp = shift ;
  my %letterwords ;
  for my $letter( split( // , $word ) ) {
      $letterwords{ $letter }++ ;
  }
  for my $letter ( split( // , $word ) ) {
      unless ( exists( $lettercomp->{$letter}) && $lettercomp->{$letter}
          >= $letterwords{ $letter } ) {
        return 0 ;
    }
  }
  return 1 ;
}

my @words = <cat bt hat tree>;

my $comparator = 'atach';
chomp $comparator ;
my %compLetters ;
for my $letter( split( // , $comparator ) ) {
  $compLetters{ $letter }++ ;
}
my @selected = grep { condition( $_ , \%compLetters )} @words ;
if ( @selected ) {
  my @nums = map { length $_ } @selected ;
  say sum( @nums ) ;
}
else {
  say 0 ;
}
