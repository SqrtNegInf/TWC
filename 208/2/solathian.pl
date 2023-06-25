#!/usr/bin/env perl
use v5.36;

use builtin 'indexed';
no warnings 'experimental';

duplicateAndMissing(1, 2, 2, 4);    # Duplicate is 2 and Missing is 3.
duplicateAndMissing(1, 2, 3, 4);    # No duplicate and missing found.
duplicateAndMissing(1, 2, 3, 3);    # Duplicate is 3 and Missing is 4.

sub findDuplicate($arrayRef)
{
    my $retVal = -1;
    
    foreach my ($i, $iVal) (indexed @$arrayRef)
    {
        foreach my ($j, $jVal) (indexed @$arrayRef)
        {
            if( ($i != $j) && ($iVal == $jVal))
            {
                $retVal = $iVal;
                last;
            }
        }
    }
    return $retVal;
}

sub findMissing($arrayRef)
{
    my $missing  = ($arrayRef->[-1]) + 1;    # set is as the last element + 1
    my $last     = ($arrayRef->[0])  - 1;    # set it for the first element as expected
    
    foreach my $current ( @$arrayRef )
    {
        if($current == ($last + 1))   { $last++                       }
        else                          { $missing = ($last + 1)        }
    }
    
    return $missing;
}


sub duplicateAndMissing( @list )
{
    my $duplicate = findDuplicate(\@list);
    my $missing;
    
    if( $duplicate == -1)
    {
        say("No duplicate and missing found.");
        return -1;
    }
    else
    {
        $missing = findMissing(\@list);
        
        say("Duplicate: $duplicate, Missing: $missing");
    }

}
