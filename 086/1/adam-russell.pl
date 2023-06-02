#!/usr/bin/env perl
use v5.36;
use strict;
use warnings;

use boolean;
use Math::Combinatorics;

sub build_constraints{
    my @constraints;
    my $a_not_equal_b = sub { $_[0] != $_[1] };
    my $difference_equal_n = sub { $_[0] - $_[1] == $_[2] };
    return (
       $a_not_equal_b,
       $difference_equal_n
    );
}

MAIN:{
    my $combinations = Math::Combinatorics->new(
                           count => 2,
                           data => [10, 8, 12, 15, 5],
                       );
    my $found = false;  
    my ($check_equal, $check_difference) = build_constraints();           
    while(my @combination = $combinations->next_combination()){  
        if($check_equal->(@combination) && $check_difference->(@combination, 7)){
            $found = true;
            print "1\n"; last;
        }
    }
    print "0\n" if(!$found);
}
