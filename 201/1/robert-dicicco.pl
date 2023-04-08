#!/usr/bin/env perl
use v5.36.0;
use strict;
use warnings;
use feature qw/say/;

my @arrs = ([0,1,3],[0,1]);


for my $arr (@arrs) {

    my $len = @$arr;

    print("Input: \@array = \[@$arr\]\n");

    for (my $x = 0; $x <= $len; $x++ ){

        if ( grep( /$x/, @$arr ) ) {

            next;

        } else {

            print "Output: $x\n\n";

        }

    }

}
