#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

use List::Util qw ( max ) ;

my @numbers =[1, 2, 2, 4, 1, 5];
my %frequencies ;
map { $frequencies{$_}++ } @numbers ;
my $maximum = max( values( %frequencies ) ) ;
my $maxElements = scalar( grep { $frequencies{ $_ } == $maximum } keys %frequencies ) ;
#what we are interested in is the product of maximum frequency and the number of element
#that are that frequent
say ( $maxElements * $maximum ) ;
