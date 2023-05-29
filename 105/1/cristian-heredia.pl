#!/usr/bin/env perl
use v5.36;


my $N = 5;
my $k = 34;

calculeRoot();

sub calculeRoot {
    my $result =  $k ** (1/$N);
    #Two decimals
    $result = sprintf("%.2f", $result);
    #Remove trailing zeros
    $result = sprintf("%g",$result);
    print "$result\n";
}

