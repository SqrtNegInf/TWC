#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0);
use Math::Fibonacci qw(isfibonacci);

my $fibcnt = 20;
my @expected = (0, 1, 2, 3, 5, 8, 10, 11, 12, 14, 17, 20, 21, 23, 26, 30, 32, 35, 41, 44);

my $cnt = 0;
while($fibcnt){
    my $sumval = SingleSumOfDigits($cnt);
    if(isfibonacci($sumval)){
        print("$cnt ");
        $fibcnt--;
    }

    $cnt++;
}

sub SingleSumOfDigits { sum0 split '', $_[0] }
