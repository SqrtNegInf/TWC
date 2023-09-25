#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub duplicateZeros(@ints)
{
    [ (map { $_ || (0,0) } @ints)[0 .. $#ints] ]
}

sub dz_A(@ints)
{
    my $maxLen = @ints;
    my @output;
    while ( @output < $maxLen )
    {
        push @output, shift @ints;
        push @output, 0 if ( $output[-1] == 0 && @output < $maxLen );
    }
    return \@output;
}

sub dz_B(@ints)
{
    for (my $i = 0 ; $i <= $#ints; $i++ )
    {
        if ( $ints[$i] == 0 )
        {
            # Insert a zero and advance i past it
            splice(@ints, $i++, 0, 0);
            pop @ints; # Maintain the length;
        }
    }
    return \@ints;
}

sub runTest
{
    use Test::More;

    is_deeply( duplicateZeros(1,0,2,3,0,4,5,0), [1,0,0,2,3,0,0,4], "Example 1");
    is_deeply( duplicateZeros(1,2,3          ), [1,2,3          ], "Example 2");
    is_deeply( duplicateZeros(0,3,0,4,5      ), [0,0,3,0,0      ], "Example 3");
    is_deeply( duplicateZeros(0), [0], "One Zero");
    is_deeply( duplicateZeros(2, 1, 0), [2, 1, 0], "Ends on a zero");

    is_deeply( dz_A(1,0,2,3,0,4,5,0), [1,0,0,2,3,0,0,4], "Example 1");
    is_deeply( dz_A(1,2,3          ), [1,2,3          ], "Example 2");
    is_deeply( dz_A(0,3,0,4,5      ), [0,0,3,0,0      ], "Example 3");
    is_deeply( dz_A(0), [0], "One Zero");
    is_deeply( dz_A(2, 1, 0), [2, 1, 0], "Ends on a zero");

    is_deeply( dz_B(1,0,2,3,0,4,5,0), [1,0,0,2,3,0,0,4], "Example 1");
    is_deeply( dz_B(1,2,3          ), [1,2,3          ], "Example 2");
    is_deeply( dz_B(0,3,0,4,5      ), [0,0,3,0,0      ], "Example 3");
    is_deeply( dz_B(0), [0], "One Zero");
    is_deeply( dz_B(2, 1, 0), [2, 1, 0], "Ends on a zero");

    done_testing;
}
