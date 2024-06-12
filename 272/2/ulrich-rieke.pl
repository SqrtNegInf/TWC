#!/usr/bin/env perl
use v5.36;

my $word  = 'perl';
my @numbers = map { ord $_ } split( // , $word ) ;
my $len = scalar( @numbers ) ;
my $sum = 0 ;
for my $pos( 0..$len - 2 ) {
   my $diff = abs($numbers[ $pos ] - $numbers[ $pos + 1 ]) ;
   $sum += $diff ;
}
say $sum ;
