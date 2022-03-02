#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my $line = '2 5 4 4 5 5 2';
chomp $line ;
while ( $line !~ /(\d+\s*)+/ ) {
  say "Enter a line of integers separated by spaces!" ;
  $line = <STDIN> ;
  chomp $line ;
}
my @array = split( /\s/ , $line ) ;
my %numcount ;
map { $numcount{$_}++ } @array ;
my @once = grep { $numcount{$_} % 2 == 1 } keys %numcount ;
say $once[0] ;
