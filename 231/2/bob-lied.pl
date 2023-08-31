#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub seniorCitizen(@passenger)
{
    # return scalar grep { $_ >= 60 } map { substr($_, 11, 2) } @passenger;
    return scalar grep { substr($_, 11, 2) >= 60 } @passenger;
}

sub sc_pack(@passenger)
{
    return scalar grep { (unpack("A10 A1 A2 A2", $_))[2] >= 60 } @passenger;
}

sub runTest
{
    use Test2::V0;

    is( seniorCitizen( qw( 7868190130M7522 5303914400F9211 9273338290F4010) ), 2, "Example 1");
    is( seniorCitizen( qw( 1313579440F2036 2921522980M5644) ), 0, "Example 2");

    is( sc_pack( qw( 7868190130M7522 5303914400F9211 9273338290F4010) ), 2, "Example 1");
    is( sc_pack( qw( 1313579440F2036 2921522980M5644) ), 0, "Example 2");

    done_testing;
}
