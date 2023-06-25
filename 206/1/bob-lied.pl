#!/usr/bin/env perl
use v5.36;

use List::Util qw/min/;

use constant  {
    MINPERDAY => 24 * 60
};

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

# Map a string in HH:MM format to the minute past midnight.
sub hhmmToMin($hhmm)
{
    my ($hour, $min) = split(':', $hhmm);
    my $minOfDay = $hour * 60 + $min;
    return ($minOfDay == MINPERDAY ? 0 : $minOfDay);
}

sub shortestTime($moments)
{
    my @minutes =  map { hhmmToMin($_) } $moments->@*;

    my $least = MINPERDAY;

    # Do a full NxN scan of every possible pair.  Getting the difference
    # in either direction will wash away the ambiguity of 00:00.
    for ( my $beg = 0 ; $beg <= $#minutes ; $beg++ )
    {
        for ( my $end = 0; $end <= $#minutes ; $end++ )
        {
            next if $end == $beg;
            my $d1 = ( $minutes[$end] - $minutes[$beg] ) % MINPERDAY;
            $least = min($least, $d1 );
        }
    }
    return $least;
}

sub runTest
{
    use Test::More;

    is( shortestTime( [ "00:00", "23:55", "20:00" ] ),           5, "Example 1");
    is( shortestTime( [ "01:01", "00:50", "00:57" ] ),           4, "Example 2");
    is( shortestTime( [ "10:10", "09:30", "09:00", "09:55" ] ), 15, "Example 3");

    is( shortestTime( [ "00:02", "23:58", "00:57" ] ),           4, "'round midnight");
    is( shortestTime( [ "00:02", "00:57", "00:02" ] ),           0, "Zero");
    is( shortestTime( [ "23:55", "24:00", "00:02" ] ),           2, "24:00");
    is( shortestTime( [ "23:55", "24:00", "00:07" ] ),           5, "24:00 again");

    done_testing;
}

