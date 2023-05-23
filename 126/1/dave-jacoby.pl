#!/usr/bin/env perl
use v5.36;

use Carp;
use Getopt::Long;

my $n = 200;
GetOptions( 
    'n=i' => \$n
);

croak 'Out of Range!' if $n < 1;

say join ', ' , dont_contain( $n );

sub dont_contain ($n ) {
    return grep { ! /1/ } 1 .. $n
}
