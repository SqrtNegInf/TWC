#!/usr/bin/env perl

use strict ;
use warnings ;
use utf8 ;
use feature qw{ postderef say signatures state } ;
no warnings qw{ experimental::postderef experimental::signatures } ;

my $done ;

say '   x|   1   2   3   4   5   6   7   8   9  10  11';
say '----+--------------------------------------------';

for my $i ( 1 .. 11 ) {
    print join '', ( ' ' x ( 4 - length $i ) ), $i, '|' ;
    for my $j ( 1 .. 11 ) {
        my $ij = join '', sort $i, $j ;
        my $p  = $i * $j ;
        my $pp = '' ;
        $pp = $p unless $done->{ $ij }++ ;
        my $pad = ' ' x ( 4 - length $pp );
        print $pad . $pp ;
        }
    say '' ;
    }
