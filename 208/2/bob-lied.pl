#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

my $retval = dupAndMissing(@ARGV);
say "-1" if @$retval == 0;
say '(', join(',', $retval->@*), ')';


# Find a dup-and-missing where one element of the list has
# been replaced by its neighbor, eg. 1,2,2,4 or 1,2,3,3
# Returns [ dup, missing ], or [] if none found
sub dupAndMissing(@list)
{
    my $current = shift @list;
    while ( my $next = shift @list )
    {
        if ( $next == $current )
        {
            return [ $current, $current+1 ];
        }
        $current = $next;
    }
    return [];
}

# Find a dup and a missing, assuming they might not be
# next to each other, e.g. 1,2,2,3,4,6 or 1,3,4,5,5
sub dupAndMissing_B(@list)
{
    my ($dup, $missing);
    my $current = shift @list;
    while ( my $next = shift @list )
    {
        if ( $current == $next )
        {
            $dup = $current;
        }
        elsif ( $next > $current + 1 )
        {
            $missing = $current + 1;
        }
        $current = $next;
    }
    return [] unless defined $dup && defined $missing;
    return [ $dup, $missing ];
}

sub runTest
{
    use Test2::V0 -srand => 1;

    is( dupAndMissing(1,2,2,4), [2,3], "Example 1");
    is( dupAndMissing(1,2,3,4), [   ], "Example 2");
    is( dupAndMissing(1,2,3,3), [3,4], "Example 3");

    is( dupAndMissing(7,8,8,10), [8,9], "Start != 1");
    is( dupAndMissing(7,7,9,10), [7,8], "Start with dup");
    is( dupAndMissing(7,8,8),    [8,9], "Short sequence dup last");
    is( dupAndMissing(7,7,9),    [7,8], "Short sequence dup first");

    is( dupAndMissing(-6,-5,-5,-3), [-5, -4], "Negative sequence");

    is( dupAndMissing_B(1,2,2,3,4,6), [2,5], "Dup before missing");
    is( dupAndMissing_B(1,3,4,5,5,6), [5,2], "Missing before dup");

    done_testing;
}

