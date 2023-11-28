#!/usr/bin/env perl

use v5.36;
use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say groupHero(@ARGV);

sub power(@n)
{
    use List::MoreUtils qw/minmax/;

    my ($min, $max);
    if    ( @n == 0 ) { return 0; }
    elsif ( @n == 1 ) { ($min, $max) = ($n[0], $n[0]) }
    else              { ($min, $max) = minmax(@n) }
    return $max * $max * $min;
}

sub groupHero($nums)
{
    use Algorithm::Combinatorics qw/combinations/;

    my $sum = 0;
    for my $k ( 1 .. scalar(@$nums) )
    {
        for my $c ( combinations($nums, $k) )
        {
            $sum += power( $c->@* );
        }
    }
    return $sum;
}

sub runTest
{
    use Test::More;

    is_deeply( power( ),           0, "Power empty");
    is_deeply( power(2),           8, "Power 1 number");
    is_deeply( power(5,3),        75, "Power 2 numbers");
    is_deeply( power(5,4,3),      75, "Power 3 numbers");
    is_deeply( power(9, 5, 7, 1), 81, "Power 4 numbers");

    is_deeply( groupHero([2,1,4]), 141, "Example 1");

    done_testing;
}
