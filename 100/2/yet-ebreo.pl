#!/usr/bin/env perl
use v5.36;

my @triangle = ( [1], [2,4], [6,4,9], [5,1,7,2] );
my $min = 1e99;

sub f {
    my ($row, $col, $sum, $max) = @_;
    
    if ($row>$max) {
        ($sum < $min) && ($min = $sum); 
    } else {
        $sum += $triangle[$row][$col];

        f($row+1, $col,   $sum, $max);
        f($row+1, $col+1, $sum, $max);
    }
}

f(0, 0, 0, $#triangle);
say $min
