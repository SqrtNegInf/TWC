#!/usr/bin/env perl
use v5.36.0 ;

my @strings = <ab de ed bc>;
my @reversed = map { join( '' , reverse split( // , $_ ) ) } @strings ;
my %ortho ;
my %rev ;
my %common ;
for my $s ( @strings ) {
   $ortho{$s}++ ;
}
for my $s ( @reversed ) {
   $rev{ $s }++ ;
}
for my $s ( keys %ortho ) {
   if ( exists( $rev{ $s } ) ) {
      $common{$s}++ ;
   }
}
say int (scalar( keys %common ) / 2 ) ;


