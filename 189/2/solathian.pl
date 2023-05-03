#!/usr/bin/env perl
use v5.36;
my $testsEnabled = 1;

sub getMaxDegree(@array)
{
    @array = sort @array;
    my $maxDegree       = 1;
    my $currentDegree   = 1;
    my $lastElem        = -1;
    
    foreach my $elem (@array)
    {
        if($elem == $lastElem )
        {
            $currentDegree++;
            
            if($currentDegree > $maxDegree)
            {
                $maxDegree = $currentDegree;
            }
        }
        else
        {
            $currentDegree = 1;
            $lastElem = $elem;
        }

    }
    return $maxDegree;
}

sub arrayDegree(@array)
{
    my $targetDegree = getMaxDegree(@array);
    my $arrayLength  = @array;
    
    # the length of the test array
    for(my $i = 1; $i < $arrayLength; $i++)
    {
        # create subarrays of $i+1 size
        for(my $offset = 0; $offset + $i  < $arrayLength; $offset++)
        {
            my @subArray    = @array[$offset .. ($offset + $i)];

            if(getMaxDegree(@subArray) == $targetDegree)
            {
                say('(', join(',', @subArray), ')');
                return;
            }
        }
    }
}


# Examples:

my @tArray0 = (1, 3, 3, 2);
arrayDegree(@tArray0)   if($testsEnabled);
# Output: (3,3)

my @tArray1 = (1, 2, 1, 3);
arrayDegree(@tArray1)   if($testsEnabled);
# Output: (1, 2, 1)

my @tArray2 =  (1, 3, 2, 1, 2);
arrayDegree(@tArray2)   if($testsEnabled);
# Output: (2, 1, 2)

my @tArray3 = (1, 1, 2, 3, 2);
arrayDegree(@tArray3)   if($testsEnabled);
# Output: (1, 1)

my @tArray4 = (2, 1, 2, 1, 1);
arrayDegree(@tArray4)   if($testsEnabled);
# Output: (1, 2, 1, 1)
