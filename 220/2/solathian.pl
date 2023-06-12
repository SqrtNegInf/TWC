#!/usr/bin/env perl
use v5.36;

no warnings 'experimental';

use Algorithm::Combinatorics qw(permutations);
use builtin qw(true false);

squareful(1,17,8);
squareful(2, 2, 2);

sub squareful(@list)
{
    die if(@list < 2);
    
    my @permutations = permutations(\@list);
    my @last;
    
    foreach my $permutation (permutations(\@list))
    {
        # check if the last permutation is the same as current one, to overcome issue from n, n, n arrays
        if(@last)
        {
            next    if(@last ~~ @$permutation);
        }
        @last = @$permutation;
        
        my $okFlag = true;
        
        for(my $i = 0; $i < (@$permutation -1); $i++)
        {
            my $sqrt = sqrt($permutation->[$i] + $permutation->[$i + 1]);
            
            
            if( $sqrt != int($sqrt))
            {
                $okFlag = false;
                last;
            }
        }
        
        if($okFlag)
        {
            say join(',',@$permutation);
        }

    }
}
