#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;
use List::Util qw ( product sum ) ;


my @numbers = (1,3,5,6,9);
my $len = scalar( @numbers ) ;
my $am = sum( @numbers ) / $len ;
my $gm = (product( @numbers )) ** (1 / $len ) ;
my $hm = $len / ( sum ( map { 1 / $_ } @numbers ) ) ;
my @formatted = map { sprintf( "%.1f" , $_) } ( $am , $gm , $hm ) ;
say "AM = $formatted[0] , GM = $formatted[1] , HM = $formatted[2]" ;
