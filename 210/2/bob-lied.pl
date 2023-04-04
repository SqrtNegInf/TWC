#!/usr/bin/env perl

use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

say "(", join(',', numberCollision(@ARGV)->@*), ")";

sub numberCollision(@list)
{
    my $collision = true;
    while ( $collision )
    {
        $collision = false;
        for ( my $i = 0 ; $i < $#list ; $i++ )
        {
            my ($left, $right) = @list[$i, $i+1];
            next unless ( $left >= 0 && $right < 0 );

            $collision = true;
            if ( abs($left) == abs($right) )
            {
                # Both explode
                splice(@list, $i, 2);
            }
            else
            {
                my $keep = ( abs($left) > abs($right) ? $left : $right );
                # Replace the pair with the larger one
                splice(@list, $i, 2, $keep);
            }
        }
    }
    return [ @list ];
}

sub runTest
{
    use Test2::V0 -srand => 1;

    is( numberCollision(2,3,-1), [2,3], "Example 1");
    is( numberCollision(3,2,-4), [ -4], "Example 2");
    is( numberCollision(1,  -1), [   ], "Example 3");

    is( numberCollision(1     ), [ 1 ], "Singleton");
    is( numberCollision(1,2,3 ), [ 1,2,3 ], "No collision positive");
    is( numberCollision(-1,-2,-3 ), [ -1,-2,-3 ], "No collision negative");
    is( numberCollision(-1,-2,3,4 ), [ -1,-2,3,4 ], "No collision");

    done_testing;
}

