#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $Verbose = 1;
my $DoTest  = 1;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
exit(!runTest()) if $DoTest;

sub moveZero(@list)
{
    my @noZero = grep { $_ != 0 } @list;
    return [ @noZero, (0) x ( scalar(@list)-scalar(@noZero) ) ];
}

sub runTest
{
    use Test::More;

    is_deeply( moveZero(1,0,3,0,0,5), [1,3,5,0,0,0], "Example 1");
    is_deeply( moveZero(1,6,4      ), [1,6,4      ], "Example 2");
    is_deeply( moveZero(0,1,0,2,0  ), [1,2,0,0,0  ], "Example 3");
    is_deeply( moveZero(0          ), [0          ], "Example 3");

    done_testing;
}

