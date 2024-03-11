#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub bdo($startDate, $offset, $holiday = [])
{
    use DateTime::Format::ISO8601;

    my $day = DateTime::Format::ISO8601->parse_datetime($startDate);

    # Convert holday list into a hash for easy lookup
    my %bh = map { $_ => 1 } $holiday->@*;

    while ( $offset > 0 )
    {
        $day->add(days => 1);
        $offset-- if ! ( $day->day_of_week == 6
                      || $day->day_of_week == 7 
                      || $bh{$day->ymd}
                    );
    }
    return $day->ymd;
}

sub runTest
{
    use Test::More;

    is( bdo('2018-06-28', 3, ['2018-07-03'] ), '2018-07-04', "Example 1");
    is( bdo('2018-06-28', 3                 ), '2018-07-03', "Example 1");

    done_testing;
}
