#!/usr/bin/env perl
use v5.36;

use List::Util qw( max ) ;

my @numbers = (-3, 1, 2, -1, 3, -2, 4);
my $positives = scalar( grep { $_ > 0 } @numbers ) ;
my $negatives = scalar( grep { $_ < 0 } @numbers ) ;
say max( $positives , $negatives ) ;
