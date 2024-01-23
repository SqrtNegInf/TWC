#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";
use List::Util qw/sum0/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub specialNumbers(@ints)
{
    my $len = @ints;
    # Insert an extra element at the front to make it 1-indexed
    unshift @ints, $len+1;

    return sum0 map { $_ * $_ } @ints[ grep { $len % $_ == 0 } 1 .. $len ];
}

sub factorsOf($n)
{
    use List::Util qw/uniqint/;
    my @flist = (1, $n);
    for my $f ( 2 .. int(sqrt($n)) )
    {
        push @flist, ($f, $n/$f) if $n % $f == 0;
    }
    return [ uniqint sort { $a <=> $b } @flist ]
}

sub sn2(@ints)
{
    use List::MoreUtils qw/before/;
    my $len = @ints;
    return 0 if $len == 0;
    my @choose = map { $_ - 1 } before { $_ > $len } factorsOf($len)->@*;
    return sum0 map { $_ * $_ } @ints[@choose];
}

sub runTest
{
    use Test::More;

    is( specialNumbers(1,2,3,4),       21, "Example 1");
    is( specialNumbers(2,7,1,19,18,3), 63, "Example 2");
    is( specialNumbers(8            ), 64, "Singleton");
    is( specialNumbers()            ,   0, "Empty list");

    is( sn2(1,2,3,4),       21, "sn2 Example 1");
    is( sn2(2,7,1,19,18,3), 63, "sn2 Example 2");
    is( sn2(8            ), 64, "sn2 Singleton");
    is( sn2()            ,   0, "sn2 Empty list");

    is_deeply( factorsOf( 6), [1,2,3,6], "factorsOf 6");
    is_deeply( factorsOf(36), [1,2,3,4,6,9,12,18,36], "factorsOf 36");

    done_testing;
}
