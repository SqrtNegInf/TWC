#!/usr/bin/env perl
use v5.36;
use builtin "floor";
no warnings "experimental";

floorSum(2, 5, 9);
floorSum(7, 7, 7, 7, 7, 7, 7);

sub floorSum(@list)
{
    my $sum;
    
    foreach my ($iVal) (@list)
    {
        foreach my ($jVal) (@list)
        {
            $sum += floor($iVal / $jVal)
        }
    }
    
    say $sum;
}
