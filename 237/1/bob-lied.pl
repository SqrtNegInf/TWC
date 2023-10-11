#!/usr/bin/env perl
use v5.36;

use DateTime;
use DateTime::Duration;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();  exit;

sub seizeTheDay(%day)
{
    my $dt = DateTime->new(year => $day{year}, month => $day{month}, day=>1);

    my $lastDayOfMonth = DateTime->last_day_of_month( year => $day{year}, month => $day{month} );

    # Move forward until we reach the right day of the week.
    while ( $dt->day_of_week != $day{dow} )
    {
        $dt->add( days => 1);
    }

    # Move forward by weeks
    my $weekOfMonth = 1;
    while ( $weekOfMonth < $day{week} && $dt->day <= ($lastDayOfMonth->day - 7) )
    {
        $dt->add( days=> 7 );
        $weekOfMonth++;
    }

    return ( $weekOfMonth == $day{week} ) ? $dt->day : 0;
}

sub runTest
{
    use Test::More;

    is( seizeTheDay( year=>2024, month=> 4, week=>3, dow=>2), 16, "Example 1");
    is( seizeTheDay( year=>2025, month=>10, week=>2, dow=>4),  9, "Example 2");
    is( seizeTheDay( year=>2026, month=> 8, week=>5, dow=>3),  0, "Example 3");

    is( seizeTheDay( year=>2023, month=>10, week=>1, dow=>7),  1, "First sunday");
    is( seizeTheDay( year=>2023, month=> 9, week=>5, dow=>6), 30, "Last saturday");

    done_testing;
}
