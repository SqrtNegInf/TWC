#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my $N = $ARGV[ 0 ] // 200;
say scalar ( grep { $_ !~ /1/ } (1 .. $N) ) ;
