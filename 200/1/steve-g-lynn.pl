#!/usr/bin/env perl
use v5.36.0;

use List::Util qw(sum);
use Algorithm::Combinatorics qw(combinations);

say join ' ', @$_ for arithmetic_slices(1,2,3,4,6,8,10);

sub arithmetic_slices {
    my (@arry) = @_;
    
    (scalar(@_) <= 2) && (return []); 
    
    return (
    grep {my @n=$_->@*;    
        sum (map {($n[$_+1] - $n[$_]) == ($n[$_+2] - $n[$_+1]) }
        (0 .. @n-3) ) == @n-2;
        }
    map {[@arry[$_->[0] .. $_->[1]]]}
    grep {$_->[1] - $_->[0] > 1}
    combinations [0 .. @arry-1], 2 );
}





