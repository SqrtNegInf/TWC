#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

my $Diff;

GetOptions("diff:i" => \$Diff, "test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

die "Usage: $0 -d DIFF m n o ..." unless defined $Diff && @ARGV > 0;

say triplet($Diff, @ARGV);

sub triplet($diff, @nums)
{
    my $count = 0;
    my @show;
    for ( my $i = 0 ; $i <= $#nums-2; $i++ )
    {
        for ( my $j = $i+1; $j <= $#nums-1; $j++ )
        {
            my $dj = $nums[$j] - $nums[$i];

            # Input is sorted, so stop once the difference is too big.
            last if $dj > $diff;
            next unless $dj == $diff;

            for ( my $k = $j+1; $k <= $#nums ; $k++ )
            {
                my $dk = $nums[$k] - $nums[$j];
                last if $dk > $diff;
                if ( $dk == $diff )
                {
                    $count++;
                    push @show, [ $i, $j, $k ] if $Verbose;
                }
            }
        }
    }
    if ( $Verbose )
    {
        for my $triplet ( @show )
        {
            say "\@nums[$triplet->@*] = ( @nums[$triplet->@*] )";
        }
    }
    return $count;
}

sub runTest
{
    use Test::More;

    is( triplet(3, 0,1,4,6,7,10), 2, "Example 1");
    is( triplet(2, 4,5,6,7,8,9 ), 2, "Example 2");

    done_testing;
}
