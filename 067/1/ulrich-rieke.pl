#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw ( combinations ) ;

my $m = 5;
my $n = 3;
my @list = (1..$m) ;
my $iter = combinations( \@list , $n ) ;
while ( my $p = $iter->next ) {
  print "(" ;
  map { print } @{$p} ;
  print ")\n" ;
}
