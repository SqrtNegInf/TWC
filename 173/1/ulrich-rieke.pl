#!/usr/bin/env perl
use v5.36;
use List::Util qw ( all ) ;

my $number = 5456;
my @digits = split( //, $number ) ;
my @pairs ;
for my $i ( 0 .. $#digits - 1 ) {
  push @pairs , [$digits[ $i ] , $digits[ $i + 1 ]] ;
}
if ( all { abs( $_->[0] - $_->[1] ) == 1 } @pairs ) {
  say "$number is esthetic!" ;
}
else {
  say "$number is not esthetic!" ;
}
