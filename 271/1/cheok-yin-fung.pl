#!/usr/bin/env perl
use v5.36;

sub mo {
    my $mat = $_[0];
    my $max_i;
    my $max_one = 0;
    for my $i (0..$mat->$#*) {
        my $ones = grep {$_ == 1} $mat->[$i]->@*;
        if ($ones > $max_one) {
            $max_one = $ones;
            $max_i = $i;
        }
    }
    return $max_i+1;
}

use Test::More tests=>3;
ok mo([[0,1],[1,0]])==1;
ok mo([[0,0,0],[1,0,1]])==2;
ok mo([[0,0],[1,1],[0,0]])==2;
