#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

use constant { MAXLINE => 100,
               ORD_A   =>  ord('a')
           };

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

my $str = shift;
my @widths = (10) x 26;
$widths[$_] = $ARGV[$_] for 0 .. $#ARGV;

say '(', join(", ", lineCount($str, @widths)->@* ), ')';

sub lineCount($str, @widths)
{
    # Normalize to lower-case a-z only
    $str = lc $str;
    $str =~ s/[^a-z]//g;

    my $lineCount = 1;
    my $width = 0;

    # Work with character widths, actual characters don't matter
    my @cw = map { $widths[ ord($_) - ORD_A ] } split(//, $str);
    while ( defined(my $w = shift @cw) )
    {
        if ( $width + $w <= MAXLINE )
        {
            $width += $w;
        }
        else
        {
            $width = $w;
            $lineCount++;
        }
    }
    return [ $lineCount, $width ];
}

sub runTest
{
    use Test2::V0 -no_srand => 1;

    my $str;
    my @widths;
    my $lines;
    my $last;

    $str = "abcdefghijklmnopqrstuvwxyz";
    @widths = (10,10,10,10,10,10,10,10,10,10,10,10,10,
               10,10,10,10,10,10,10,10,10,10,10,10,10);
    is( lineCount($str, @widths), [ 3, 60 ], "Example 1");

    $str = "bbbcccdddaaa";
    @widths = ( 4,10,10,10,10,10,10,10,10,10,10,10,10,
               10,10,10,10,10,10,10,10,10,10,10,10,10);
    is( lineCount($str, @widths), [ 2, 4 ], "Example 2");

    done_testing;
}
