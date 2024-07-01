#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $DoTest  = 1;
my $Benchmark = 0;

GetOptions("test" => \$DoTest);
runTest();exit;

# Must not begin with a digit
say replaceDigits($_) for map { s/^[0-9]*//ir } @ARGV;

sub replaceDigits($str)
{
    my @s = split("", $str);
    my $letter = my $result = shift @s;

    while ( defined(my $next = shift @s) )
    {
        if ( $next =~ m/[^0-9]/i ) { $result .= ($letter = $next) }
        else { $result .= chr(ord($letter) + $next); }
    }
    return $result;
}


sub runTest
{
    use Test2::V0 -no_srand;

    is( replaceDigits("a1c1e1"  ), "abcdef"  , "Example 1");
    is( replaceDigits("a1b2c3d4"), "abbdcfdh", "Example 2");
    is( replaceDigits("b2b"     ), "bdb"     , "Example 3");
    is( replaceDigits("a16z"    ), "abgz"    , "Example 4");

    done_testing;
}
