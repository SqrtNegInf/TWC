#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;
use Algorithm::Combinatorics qw ( combinations_with_repetition ) ;

my $S = 6;
my %coins ;
for my $elem ( <1 2 4> ) {
  $coins{$elem}++ ;
}
my @sorted = sort { $a <=> $b } keys %coins ;
my $maxelements ; #maximum number of a given coin that adds up to S
my $minelements ; #minimum number of a given coin adding up to S
my $solutions ;
if ( $sorted[ 0 ] > $S ) {
  $solutions = 0 ;
  exit( 1 ) ;
}
my @elementsHowMany = map { $S % $_ == 0 ? ($S / $_) : (int( $S / $_ ) + 1)
} @sorted ;
$maxelements = $elementsHowMany[ 0 ] ;
if ( $elementsHowMany[ -1 ] != 0 ) {
  $minelements = $elementsHowMany[ -1 ] ;
}
else {
  my $el ;
  do {
      $el = pop @elementsHowMany ;
  } until ( $el != 0 ) ;
  $minelements = $el ;
}
for my $len ( $minelements .. $maxelements ) {
  my $iter = combinations_with_repetition (\@sorted , $len ) ;
  my $p ;
  while ( $p = $iter->next ) {
      my $sum = 0 ;
      for my $n ( @{$p} ) {
    $sum += $n ;
      }
      if ( $sum == $S ) {
    $solutions++ ;
    print '[' ;
    map { print "$_ " } @{$p} ;
    say ']' ;
      }
  }
}
say $solutions ;
