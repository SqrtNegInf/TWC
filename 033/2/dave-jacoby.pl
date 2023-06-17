#!/usr/bin/env perl
use v5.36;

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
