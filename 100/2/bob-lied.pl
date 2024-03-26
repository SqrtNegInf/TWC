#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $DoTest = 1;
my $Verbose;
GetOptions('test' => \$DoTest, 'verbose' => \$Verbose);

use List::Util qw(min);

runTest();exit;

my $minSum;
sub walk($tree, $lastRow, $row, $col, $sum)
{
    say "WALK: lastRow=$lastRow, row=$row, col=$col, sum=$sum" if $Verbose;
    if ( $row == $lastRow )
    {
        $minSum = min( ($minSum //= $sum), $sum);
        say "LEAF: row=$row, col=$col, sum=$sum: minSum=$minSum" if $Verbose;
        return $sum;
    }

    walk($tree, $lastRow, $row+1, $col,   $sum + $tree->[$row+1][$col]  );
    walk($tree, $lastRow, $row+1, $col+1, $sum + $tree->[$row+1][$col+1]);

    return $sum;
}
sub triangleSum($tri)
{
    $minSum = undef;
    my $lastRow = @$tri - 1;

    if ( $lastRow > 0 )
    {
        walk($tri, $lastRow, 1, 0, $tri->[0][0] + $tri->[1][0]) ;
        walk($tri, $lastRow, 1, 1, $tri->[0][0] + $tri->[1][1]) ;
    }
    else
    {
        $minSum = $tri->[0][0];
    }

    return $minSum;
}

sub runTest
{
    use Test::More;

    for my $case (
        [  [ [9] ]  , 9 ],
        [  [ [2], [3,5] ]  , 5 ],
        [  [ [1], [2,4], [6,4,9]  ]            , 7 ],
        [  [ [1], [2,4], [6,4,9], [5,1,7,2] ]  , 8 ],
        [  [ [3], [3,1], [5,2,3], [4,3,1,3] ]  , 7 ],
                 )
    {
        is ( triangleSum($case->[0]), $case->[1] );
    }

    done_testing;
}

