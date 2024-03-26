#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 1;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say replaceDigit($_) for @ARGV;

sub replaceDigit($t)
{
    my $pos = index($t, "?");
    if ( $pos < 0 )
    {
        warn "$t does not contain '?'";
        return '?';
    }

    return 2 if ( $pos == 0 );
    return 5 if ( $pos == 3 );
    return 9 if ( $pos == 4 );

    if ( $pos == 1 ) { return ( substr($t, 0, 1) eq "1" ) ? 9 : 3; }

    warn "$t has '?' in strange place";
    return '?';
}

sub runTest
{
    use Test::More;

    is( replaceDigit("?3:00"), 2, "?3:00");
    is( replaceDigit("1?:00"), 9, "?3:00");
    is( replaceDigit("2?:00"), 3, "?3:00");
    is( replaceDigit("12:?5"), 5, "?3:00");
    is( replaceDigit("12:5?"), 9, "?3:00");

    done_testing;
}
