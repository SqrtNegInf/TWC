#!/usr/bin/env perl
use v5.36;

use boolean;
use Math::Combinatorics;

sub build_constraints{
    my @constraints;
    my $a_not_equal_b = sub { $_[0] != $_[1] };
    my $a_not_equal_c = sub { $_[0] != $_[2] };
    my $b_not_equal_c = sub { $_[1] != $_[2] };
    my $sum_greater_than_1 = sub { 1 < ($_[0] + $_[1] + $_[2]) };
    my $sum_less_than_2 = sub { 2 > ($_[0] + $_[1] + $_[2]) };
    return (
       $a_not_equal_b,
       $a_not_equal_c,
       $b_not_equal_c,
       $sum_greater_than_1,
       $sum_less_than_2
    );
}

MAIN:{
    my $combinations = Math::Combinatorics->new(
                           count => 3,
                           data => [(1.2, 0.4, 0.1, 2.5)],
                       );
    my $found;                  
    while(my @combination = $combinations->next_combination()){  
        $found = true;  
        for my $constraint (build_constraints()){
            if(!$constraint->(@combination)){
                $found = false;
                last;
            }
        }
        do{ print "1\n"; last; } if($found);
    }
    print "0\n" if(!$found);
}
