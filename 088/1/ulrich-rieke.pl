#!/usr/bin/env perl
use strict ;
use warnings ;
use List::Util qw( product ) ;

my @array = <5 2 1 4 3>;
my @M ;
my $product = product @array ;
my $len = scalar @array ;
for my $i ( 0 .. $len - 1 ) {
  push @M , $product / $array[ $i ] ;
}
print "( " ;
map { print "$_ " } @M ;
print ")\n" ;
