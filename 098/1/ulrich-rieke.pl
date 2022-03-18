#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

sub readN {
  my ( $str , $howmany ) = @_ ;
  my $buf ;
  my $bytes_read = read( FH, $buf , $howmany ) ;
  say $buf ;
}

my $file = 'input.txt';
open ( FH , "<" , $file ) or die "Can't open $file! $!" ;
readN( $file , 4 ) ;
readN( $file , 4 ) ;
readN( $file , 2 ) ;
close FH ;
