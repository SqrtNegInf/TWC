#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();

sub lastMember($list)
{
    my @sorted = sort { $a <=> $b } @$list;

    while ( @sorted > 1 )
    {
        my @biggest = (pop @sorted, pop @sorted);
        if ( $biggest[0] != $biggest[1] )
        {
            push @sorted, $biggest[1] = $biggest[0];
        }
    }
    return scalar(@sorted);
}

sub runTest
{
    use Test::More;

    is( lastMember([2,7,4,1,8,1]) , 1, "Example 1");
    is( lastMember([1          ]) , 1, "Example 2");
    is( lastMember([1,1        ]) , 0, "Example 3");

    done_testing;
}

