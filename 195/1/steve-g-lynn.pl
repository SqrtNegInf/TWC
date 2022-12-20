#!/usr/bin/env perl

use List::MoreUtils qw(uniq);

print &special_integers(15); #14
print &special_integers(35); #32
print &special_integers(1000); #32

sub special_integers {
    my ($n)=@_;
    
    my $ctr=0;
    for my $i (1 .. $n) {
        my @n = uniq split(//,$i);
        ($i == join('',@n)) && ($ctr++);
    }
    return $ctr;
}
