#!/usr/bin/env perl
use v5.36;

my $N = $ARGV[ 0 ] // 200;
say scalar ( grep { $_ !~ /1/ } (1 .. $N) ) ;
