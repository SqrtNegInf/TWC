#!/usr/bin/env perl5.32.1

use v5.12;
use PDL;
my $how_many=18;
die "Expected a positive number" unless $how_many>0;
my ($counter, $test)=(0, 0);
while($counter<$how_many){
    my $exponents=(my $digits=long [split "", $test])->sequence+1;
    ++$counter, say "$counter: $test"
        if ($digits**$exponents)->sumover==$test;
    ++$test
}
