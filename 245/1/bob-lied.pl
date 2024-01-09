#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;
my $DoBenchmark = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose, "benchmark:i" => \$DoBenchmark);
runTest();
exit;

sub langSort_M($lang, $popularity)
{
    my @place;
    # Use map to shift to 0-based indexing.  Use a hash slice to select where
    # each of the positions is supposed to move to.
    @place[ map { $_ - 1 } $popularity->@* ] = 0 .. $lang->$#*;
    # Return (a reference to) a hash slice of the calculated positions.
    return [ $lang->@[@place] ];
}

sub langSort_S($lang, $popularity)
{
    # Sort positions by popularity, and alphabetically if tied.
    # Use a hash slice to select the new positions.
    [ $lang->@[ sort { $popularity->[$a] <=> $popularity->[$b]
                     || $lang->[$a] cmp $lang->[$b] } 0 .. $lang->$#* ] ]
}

sub runTest
{
    use Test::More;

    for my $version ( \&langSort_M, \&langSort_S )
    {

    is_deeply( $version->( [<perl c python >],   [2,1,3] ), [<c perl python   >], "Example 1");
    is_deeply( $version->( ['c++', 'haskell', 'java'], [1,3,2] ), ['c++', 'java', 'haskell'], "Example 2");

    is_deeply( $version->( [qw(a b c d e)], [1..5] ), [qw(a b c d e)], "More than 3");
    is_deeply( $version->( [qw(a b c d e)], [5,4,3,2,1] ), [qw(e d c b a)], "More than 3 backwards");
    is_deeply( $version->( [qw(a b c d e)], [5,1,3,2,4] ), [qw(b d c e a)], "More than 3 shuffled");

    }

    done_testing;
}

sub runBenchmark($repeat)
{
    use Benchmark qw/cmpthese/;

    my @name = ('a' .. 'z', 'A' .. 'Z') x 10;
    my @order =  reverse 1 .. @name;

    cmpthese($repeat, {
            "mapping" => sub { langSort_M(\@name, \@order) },
            "sorting" => sub { langSort_S(\@name, \@order) },
    });
}
