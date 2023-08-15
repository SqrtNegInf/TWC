#!/usr/bin/env perl
use v5.36;

use List::Util qw/min/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

sub emptyArray(@int)
{
    my $opCount = 0;
    while ( @int )
    {
        say "(", join(",", @int), ")" if $Verbose;
        $opCount++;

        # Remove first element
        my $front = shift(@int);

        # Put it on the end if it wasn't the smallest
        push @int, $front if @int && $front > min(@int);
    }
    return $opCount;
}

sub runTest
{
    use Test::More;

    is( emptyArray(3,4,2), 5, "Example 1");
    is( emptyArray(1,2,3), 3, "Example 2");
    is( emptyArray(5,4,3), 6, "Reverse order");
    is( emptyArray(7    ), 1, "Singleton");
    is( emptyArray(     ), 0, "Empty list");


    done_testing;
}
