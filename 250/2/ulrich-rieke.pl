#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;
use List::Util qw ( max ) ;

sub convert {
   my $string = shift ;
   if ( $string =~ /\D/ ) {
      return length $string ;
   }
   else {
      return ($string + 0) ;
   }
}

my @strings = <perl 2 r4ku>;
my @converted ;
for my $s ( @strings ) {
   push @converted , convert( $s ) ;
}
say max( @converted ) ;
