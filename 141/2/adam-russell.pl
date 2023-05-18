#!/usr/bin/env perl
use v5.36;

use Data::PowerSet q/powerset/;

sub like_numbers{
    my($m, $n) = @_; 
    my @divisible; 
    for my $subset (@{powerset(split(//, $m))}){
        my $i = join("", @$subset);
        push @divisible, $i if $i && $i != $m && $i % $n == 0;
    }  
    return @divisible;
}

MAIN:{
    print like_numbers(1234, 2) . "\n";
    print like_numbers(768, 4) . "\n";
}
