#!/usr/bin/env perl
use v5.36;

use builtin 'indexed';
no warnings 'experimental';

uneqTrip(4, 4, 2, 4, 3);                 # Output 3
uneqTrip(1, 1, 1, 1, 1);                 # Ouput: 0
uneqTrip(4, 7, 1, 10, 7, 4, 1, 1);       # Output: 28



sub uneqTrip( @list)
{
    my $count = 0;
    OUTER:
    foreach my($i, $val_i) (indexed @list)
    {
        foreach my($j, $val_j) (indexed @list)
        {
            # last if last if( $i == $j || $j == $k || $i == $k);
            last if( $i == $j );
            foreach my($k, $val_k) (indexed @list)
            {
                last if( $j == $k );
                $count++    if( $val_i != $val_j and  $val_j != $val_k and  $val_k != $val_i);
            }
        }
    }
    
    say $count;
}
