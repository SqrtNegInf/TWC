#!/usr/bin/env perl
use v5.36;

my $edge = 5 ;
my $internal = 5 ;
print " " x $edge ;
say "^" x $internal ;
for my $i (1 .. 3 ) {
  $edge-- ;
  if ( $i > 1 ) {
      $internal += 2 ;
  }
  say " " x $edge . "^" . " " x $internal . "^" ;
}
for (1 .. 4 ) {
  say " " x $edge . "^" . " " x $internal . "^" ;
}
for ( 1 .. 2 ) {
  $edge++ ;
  $internal -= 2 ;
  say " " x $edge . "^" . " " x $internal . "^" ;
}
$edge++ ;
say " " x $edge . "^" x 5 ;
$edge += 2 ;
for (1 .. 3 ) {
  say " " x $edge . "^" ;
}
$edge -= 2 ;
say " " x $edge . ( "^" x 5 ) ;
$edge += 2 ;
for (1 .. 2 ) {
  say " " x $edge . "^" ;
}
