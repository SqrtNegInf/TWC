#!/usr/bin/env perl
use v5.36;

my @numbers = (5, 2, 1, 6);
my @result ;
for my $num( @numbers ) {
   push @result , scalar( grep { $_ < $num } @numbers ) ;
}
say "(" . join( ',' , @result ) . ")" ;
