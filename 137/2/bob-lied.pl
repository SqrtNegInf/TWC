#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

my $MaxIter = 500;
my $MaxSum  = 10_000_000;

#GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
exit(!runTest()); # if $DoTest;

sub isPalindrome($n)
{
    return 1 if $n < 10;
    my @dig = split("", $n);
    while ( @dig && $dig[0] == $dig[-1] )
    {
        @dig = @dig[ 1 .. $#dig-1 ];
    }
    return @dig == 0;
}

sub isLychrel($n)
{
    my $iter = 0;
    my $sum  = $n;
    while ( $iter < $MaxIter && $sum < $MaxSum )
    {
        my $revn = join("", reverse split(//, $n));
        $sum = $n + $revn;
        say "$iter: $n + $revn = $sum" if $Verbose;
        return 0 if isPalindrome($sum);
        $n = $sum;
    }
    return 1;
}

sub runTest
{
    use Test::More;

    is( isPalindrome(   1),  1, "P=1");
    is( isPalindrome(  22),  1, "P=22");
    is( isPalindrome(  27), '', "P=27");
    is( isPalindrome( 343),  1, "P=343");
    is( isPalindrome( 346), '', "P=346");

    is( isLychrel( 56), 0, "N=56");
    is( isLychrel( 57), 0, "N=57");
    is( isLychrel( 59), 0, "N=59");
    is( isLychrel(196), 1, "N=196");

    done_testing;
}

