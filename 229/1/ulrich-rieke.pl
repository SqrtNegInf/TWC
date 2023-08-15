#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

sub isSorted {
   my $word = shift ;
   my $compare = $word ;
   return ( $compare eq join( '' , sort { $a cmp $b } split( // , $word ) ) ||
	 $compare eq join( '' , sort { $b cmp $a } split( // , $word ) ) ) ;
}

my $line = 'abc bce cae';
chomp $line ;
say scalar( grep { not isSorted( $_ ) } split ( /\s/ , $line ) ) ;
