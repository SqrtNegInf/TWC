#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub twoOutOfThree($arrayOfarray)
{
    my %appearsIn;
    # Count number of arrays, should be 0,1,2
    for my $v ( 0 .. $arrayOfarray->$#* )
    {
        # Set a bit corresponding to the vector we're looking at.
        my $bit = 1 << $v;

        # Loop over elements in one of the arrays.
        for my $elem ( $arrayOfarray->[$v]->@* )
        {
            $appearsIn{$elem} |= $bit;
        }
    }

    # Possible bit combinations where at least two of three bits are set
    # 0 -- 0 0 0 -- no
    # 1 -- 0 0 1 -- no
    # 2 -- 0 1 0 -- no
    # 3 -- 0 1 1 -- YES
    # 4 -- 1 0 0 -- no
    # 5 -- 1 0 1 -- YES
    # 6 -- 1 1 0 -- YES
    # 7 -- 1 1 1 -- YES
    
    return [ grep { my $n = $appearsIn{$_}; $n == 0x3 || $n > 0x4 }
             sort keys %appearsIn
           ];
}

sub runTest
{
    use Test2::V0;

    is( twoOutOfThree( [ [1,1,2,4], [2,4], [4] ] ), [2, 4],     "Example 1");
    is( twoOutOfThree( [ [4,1], [2,4], [1,2] ] ),   [1,2,4], "Example 2");

    is( twoOutOfThree( [ [1,2,2], [1,3,4], [1,5,6] ] ), [1],   "Twice in one");
    is( twoOutOfThree( [ [1,2,2], [1,2,4], [1,5,6] ] ), [1,2], "Thrice in two");

    done_testing;
}
