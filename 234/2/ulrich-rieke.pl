#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw ( combinations ) ;

my @numbers = (4, 4, 2, 4, 3);
my %frequencies ;
for my $n ( @numbers ) {
   $frequencies{ $n }++ ;
}
for my $n ( keys %frequencies ) {
   $frequencies{ $n } = scalar (grep { $_  == $n } @numbers ) ;
}
my $sum = 0 ;
my @uniques = keys %frequencies ;
if ( scalar( @uniques ) >= 3 ) {
   my $iter = combinations( \@uniques , 3 ) ;
   while ( my $c = $iter->next ) {
      my $product = 1 ;
      for my $d (0..2) {
	 $product *= $frequencies{ $c->[$d] } ;
      }
      $sum += $product ;
   }
   say $sum ;
}
else {
   say 0 ;
}

