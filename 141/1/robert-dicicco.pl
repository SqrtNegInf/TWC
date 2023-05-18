#!/usr/bin/env perl
use v5.36;

use ntheory qw/ divisors /;

my $FACNUM = 8;
my $LIMIT = 10;
my ($fnd,$num) = 0;

while(1){
    $num++;
    my @d = divisors($num);
    if(scalar(@d) == $FACNUM){
        print("$num =  ");
        foreach my $n (@d){
            print($n . " ");
        }
        print("\n");
        $fnd++;
        last if($fnd == $LIMIT );
       }
}
