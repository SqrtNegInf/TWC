#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub thirdSmallest($matrix)
{
    my @smallest;
    for my $r ( @$matrix )
    {
        for my $c ( 0 .. $r->$#* )
        {
            # Put new value at end and shuffle down into place
            push @smallest, $r->[$c];
            for ( my $p = $#smallest; $#smallest > 0 && $p > 0 ; $p-- )
            {
                if ( $smallest[$p] < $smallest[$p-1] )
                {
                    @smallest[$p-1,$p] = @smallest[$p, $p-1];
                }
            }
            pop @smallest if @smallest > 3;
            say "smallest=[@smallest]" if $Verbose;
        }
    }
    return $smallest[2];
}

sub runTest
{
    use Test2::V0;

    is(thirdSmallest( [[3,1,2], [5,2,4], [0,1,3] ] ),  1, "Example 1");
    is(thirdSmallest( [[2, 1],  [4, 5]] ),             4, "Example 2");
    is(thirdSmallest( [[1,0,3], [0,0,0], [1,2,1]] ),   0, "Example 3");

    done_testing;
}
