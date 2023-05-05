#!/usr/bin/env perl
use v5.36;

use List::Util qw(all);
my $how_many=shift//1;
my $current=1;
my $found=0;
while($found<$how_many){
    say("$found: ", join " ", map {$_*$current} (1..6)), ++$found
        if all {ordered($current)==ordered($_*$current)} (2..6);
    ++$current;
}

sub ordered($n){
    join "", sort {$a<=>$b} split "", $n
}
