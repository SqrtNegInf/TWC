#!/usr/bin/env perl

use v5.36;
use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;
my $DoBenchmark = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose, "benchmark:i" => \$DoBenchmark);
runTest(); exit;

sub flipMatrix($m)
{
    for my $row ( $m->@* )
    {
        for ( my ($front, $back) = (0, $row->$#*); $front <= $back ; $front++, $back-- )
        {
            $row->@[$front, $back] = map { ( $_ + 1 ) & 1 } $row->@[$back, $front];
        }
    }
    return $m;
}

sub flipMatrix_B($m)
{
    my @result;
    for my $row ( $m->@* )
    {
        push @result, [ map { $_ == 1 ? 0 : 1 } reverse $row->@* ];
    }
    return \@result;
}

sub flipMatrix_S($m)
{
    my @result;
    for my $row ( $m->@* )
    {
        (my $s = reverse qq($row->@*)) =~ tr/01/10/;
        push @result, [ split(" ", $s) ];
    }
    return \@result;
}

sub runTest
{
    use Test2::V0;

    is( flipMatrix([[1, 1, 0], [1, 0, 1], [0, 0, 0]]),
        [[1, 0, 0], [0, 1, 0], [1, 1, 1]], "Example 1");

    is( flipMatrix([[1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]]),
        [[1, 1, 0, 0], [0, 1, 1, 0], [0, 0, 0, 1], [1, 0, 1, 0]], "Example 2");

    is( flipMatrix( [[]]),          [[]],          "0x0");
    is( flipMatrix( [[1]]),         [[0]],         "1x1");
    is( flipMatrix( [[1,0],[1,0]]), [[1,0],[1,0]], "2x2");

    is( flipMatrix_B([[1, 1, 0], [1, 0, 1], [0, 0, 0]]),
        [[1, 0, 0], [0, 1, 0], [1, 1, 1]], "B Example 1");

    is( flipMatrix_B([[1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]]),
        [[1, 1, 0, 0], [0, 1, 1, 0], [0, 0, 0, 1], [1, 0, 1, 0]], "B Example 2");

    is( flipMatrix_B( [[]]),          [[]],          "B 0x0");
    is( flipMatrix_B( [[1]]),         [[0]],         "B 1x1");
    is( flipMatrix_B( [[1,0],[1,0]]), [[1,0],[1,0]], "B 2x2");

    is( flipMatrix_S([[1, 1, 0], [1, 0, 1], [0, 0, 0]]),
        [[1, 0, 0], [0, 1, 0], [1, 1, 1]], "S Example 1");

    is( flipMatrix_S([[1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]]),
        [[1, 1, 0, 0], [0, 1, 1, 0], [0, 0, 0, 1], [1, 0, 1, 0]], "S Example 2");

    is( flipMatrix_S( [[]]),          [[]],          "S 0x0");
    is( flipMatrix_S( [[1]]),         [[0]],         "S 1x1");
    is( flipMatrix_S( [[1,0],[1,0]]), [[1,0],[1,0]], "S 2x2");
    done_testing;
}

sub benchmark($repeat)
{
    use Benchmark qw/:all/;

    cmpthese($repeat, {
        'my reverse' => sub { flipMatrix([[1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]]) },
        'builtin reverse' => sub { flipMatrix_B([[1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]]) },
        'string tr' => sub { flipMatrix_S([[1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]]) },
    } );
    return 0;
}
