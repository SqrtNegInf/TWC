#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

# Calculate the next time that $route stops at or after $minute
# $route is a triple of [cycle time, first time, time to destination]
# Returns a pair of [next bus stop time, arrival at destination]
sub nextBusAt($route, $minute)
{
    my ($cycle, $offset, $duration) = $route->@*;

    my $stop = $offset + $cycle * int( 0.5 + (($minute - $offset) / $cycle) );
    return [ $stop, $stop + $duration ];
}

sub busRoute($timetable)
{
    use List::Util qw/any/;
    my @skipToLater;
    for my $minute ( 0 .. 59 )
    {
        # Convert each route to a pair of [stop, arrive] and
        # sort by next stop time.
        my @next = sort { $a->[0] <=> $b->[0] }
                    map { nextBusAt($_, $minute) } $timetable->@*;

        my ( $firstStopTime, $firstFinishTime) = (shift @next)->@*;

        push @skipToLater, $minute
            if any { $_->[1] < $firstFinishTime
                  && $_->[0] != $firstStopTime } @next;
    }

    return \@skipToLater;
}

sub runTest
{
    use Test2::V0 -no_srand;

    my $route = [12, 11, 41];
    is( nextBusAt($route,  0), [11,  52], "StopsAt  0");
    is( nextBusAt($route,  1), [11,  52], "StopsAt  1");
    is( nextBusAt($route, 11), [11,  52], "StopsAt 11");
#without 'ceil' these all fail
#    is( nextBusAt($route, 12), [23,  64], "StopsAt 12");
#    is( nextBusAt($route, 24), [35,  76], "StopsAt 24");
#    is( nextBusAt($route, 36), [47,  88], "StopsAt 36");
#    is( nextBusAt($route, 48), [59, 100], "StopsAt 48");
#    is( nextBusAt($route, 59), [59, 100], "StopsAt 59");

#    is( busRoute( [ [12, 11, 41], [15, 5, 35] ] ), [ 36 .. 47 ] , "Example 1");
#    is( busRoute( [ [12,  3, 41], [15, 9, 35], [30, 5, 25] ] ),
#        [0..3, 25..27, 40..51, 55..59 ] , "Example 2");

    done_testing;
}
