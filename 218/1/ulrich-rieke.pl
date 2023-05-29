#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

use Algorithm::Combinatorics qw ( combinations ) ;
use List::Util qw ( product max ) ;

#say "Enter at least 3 integers, separated by blanks!" ;
#my $line = <STDIN> ;
#chomp $line ;
my @numbers = ( -8,  2, -9,  0, -4, 3);
if ( scalar( @numbers ) == 3 ) {
  say product( @numbers ) ;
}
else {
  my @products ;
  my $iter = combinations( \@numbers , 3 ) ;
  while ( my $c = $iter->next ) {
      push @products , product( @{$c} ) ;
  }
  say max( @products ) ;
}
