#!/usr/bin/env perl
use v5.36;
use Lingua::EN::Numbers::Ordinate;

sub maxIndex
{
    my ($arrayRef)  = @_;

    my @sortedArray = sort { $a <=> $b } @$arrayRef;    # sort the array
    my $max         = $sortedArray[-1];                 # get the last element of the array
    my $length      = @$arrayRef;                       # get the length of the array

    for(my $i = 0; $i < $length; $i++)
    {
        if($arrayRef->[$i] == $max) # check if it is the greatest element
        {
            # print the result and break the loop
            print   "Output: $i (as ", ordinate($i+1), " in the list is the greatest number)";
            last;
        }
    }

}

my @sampleArray = (5, 2, 9, 1, 7, 6, 9);
maxIndex(\@sampleArray);
