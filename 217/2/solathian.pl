#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(permutations);

maxNum(1, 23);          # 231
maxNum(10, 3, 2);       # 3210
maxNum(31, 2, 4, 10);   # 431210
maxNum(5, 11, 4, 1, 2); # 542111
maxNum(1, 10);          # 110


sub maxNum(@list)
{  
    my $max = -1;
    
    foreach my $permutation ( permutations(\@list))
    {
        my $number = join('', @$permutation);
        
        $max = $number      if( $number > $max );
    }
    
    say $max;

}
