#!/usr/bin/env perl

use v5.36;

sub good_pairs{
    my(@numbers) = @_;
    my @pairs;  
    do{ 
        my $i = $_;
        do{
            my $j = $_;
            push @pairs, [$i, $j] if $numbers[$i] == $numbers[$j] && $i < $j;  
        } for 0 .. @numbers - 1;
    } for 0 .. @numbers - 1;
    return 0 + @pairs;  
}

MAIN:{
    say good_pairs 1, 2, 3, 1, 1, 3;
    say good_pairs 1, 2, 3;
    say good_pairs 1, 1, 1, 1;
}
