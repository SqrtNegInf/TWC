#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

sub runTest
{
    use Test::More;

    my $TestResult;
    my $dataStart =  tell DATA;
    my $outfh;
    open($outfh, ">", \$TestResult) || die "open TestResult: $!";

    my $reInit = sub {
        seek(DATA, $dataStart, 0);
        $. = 0;
        close($outfh);
        open($outfh, ">", \$TestResult);
    };

        is( linesRange(*DATA, $outfh,  1,  1), 1, "first line");
        close($outfh);
        is( $TestResult, "L1\n", "check first line" );
    $reInit->();
        is( linesRange(*DATA, $outfh,  1,  4), 4, "head lines");
        is( $TestResult, "L1\nL2\nL3\nL4\n", "check head lines" );
    $reInit->();
        is( linesRange(*DATA, $outfh,  9, 12), 4, "tail lines");
        is( $TestResult, "L9\nL10\nL11\nL12\n", "check tail lines" );
    $reInit->();
        is( linesRange(*DATA, $outfh, 12, 12), 1, "last line");
        is( $TestResult, "L12\n", "check last lines" );
    $reInit->();
        is( linesRange(*DATA, $outfh, 10, 15), 3, "past end");
        is( $TestResult, "L10\nL11\nL12\n", "check past end lines" );
    $reInit->();
        is( linesRange(*DATA, $outfh, 15, 18), 0, "outside");
        is( $TestResult, "", "check outside lines" );

    done_testing;
}

my $doTest;
GetOptions('test!' => \$doTest);


my $infh;

runTest(); exit;

my ($File, $A, $B) = @ARGV;

open($infh, "<", $File) || die;

linesRange($infh, *STDOUT, $A, $B);

sub linesRange
{
    my ($infh, $outfh, $beg, $end) = @_;
    my $count = 0;

    while (<$infh>)
    {
        if ( $. >= $beg && $. <= $end )
        {
            print $outfh $_;
            $count++;
        }
        last if $. > $end; # Don't read the whole thing uselessly
    }
    return $count;
}

__DATA__
L1
L2
L3
L4
L5
L6
L7
L8
L9
L10
L11
L12
