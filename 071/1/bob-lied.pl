#!/usr/bin/env perl
use v5.36;
srand 1;

use Getopt::Long;


my ($MinVal, $MaxVal) = (1, 50);

sub Usage { "Usage: $0 N\n\tN>1" }

sub isPeak
{
    my ($prev, $me, $next) = @_;
    return ($prev < $me) && ($me > $next);
}

sub peakElement
{
    my @arr = ($MinVal-1, @_, $MinVal-1);
    my @peak = ();
    my $last = $#arr - 1;

    foreach ( 1..$last )
    {
        if ( isPeak($arr[$_-1], $arr[$_], $arr[$_+1] ) )
        {
            push @peak, $arr[$_]
        }
    }

    return \@peak;
}

sub makeArray
{
    my ($min, $max, $size) = @_;
    my @chooseFrom = ( $min .. $max );
    my @result;

    for my $n ( 1..$size )
    {
        push @result, splice(@chooseFrom, int(rand(@chooseFrom)), 1)

    }
    return @result;
}

sub checkUniq
{
    my (@arr) = @_;
    my %uniq;
    $uniq{$_}++ foreach @arr;
    my $notUnique = grep { $_ != 1 } values %uniq;
    return $notUnique == 0;
}

sub runTest
{
    use Test::More;
    is( scalar(makeArray(1, 50, 10)), 10, "Make random array size  10");
    ok( checkUniq(makeArray(1, 50, 10)), "Random array unique elements");

    is_deeply(peakElement(2, 1 ),         [2],    "two elements, left");
    is_deeply(peakElement(1, 2 ),         [2],    "two elements, right");
    is_deeply(peakElement(6, 4, 2 ),      [6],    "three elements, first");
    is_deeply(peakElement(6, 8, 2 ),      [8],    "three elements, middle");
    is_deeply(peakElement(6, 7, 9 ),      [9],    "three elements, last");
    is_deeply(peakElement(8, 5, 9 ),      [8,9],  "three elements, both ends");
    is_deeply(peakElement(1, 3, 5, 4),    [5],    "even # elements, middle peak ");
    is_deeply(peakElement(9, 3, 5, 8),    [9, 8], "even # elements, both ends ");
    is_deeply(peakElement(9, 3, 4, 5, 8), [9, 8], "odd # elements, both ends ");
    is_deeply(peakElement(3, 9, 4, 8, 5), [9, 8], "odd # elements, middle peaks");

    is_deeply(peakElement(18, 45, 38, 25, 10, 7, 21, 6, 28, 48), [45, 21, 48], "example 1");
    is_deeply(peakElement(47, 11, 32, 8, 1, 9, 39, 14, 36, 23), [47, 32, 39, 36], "example 2");


    my ($result) = (done_testing())[0];
    return $result;
}

########## MAIN ##########

my $doTest;
GetOptions('test!' => \$doTest);

runTest(); exit;

my $N = $ARGV[0] // 20;
die Usage() unless $N > 1;

my @uniqArray = makeArray($MinVal, $MaxVal, $N);
my $peaks = peakElement @uniqArray;

say "Array: ", join ",", @uniqArray;
say "Peaks: ", join ",", @$peaks;
