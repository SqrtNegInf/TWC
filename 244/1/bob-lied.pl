#!/usr/bin/env perl
use v5.36;
use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;
my $DoBenchmark = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose, "benchmark:i" => \$DoBenchmark);
runTest(); exit;
#exit( runBenchmark($DoBenchmark) ) if $DoBenchmark;

say "(", join(",", countSmaller_C(\@ARGV)->@*), ")";

sub countSmaller_A($nums)
{
    my @sorted = sort { $a <=> $b } $nums->@*;
    my @smaller = ();
    for my $i ( $nums->@* )
    {
        my $count = 0;
        for my $j ( @sorted )
        {
            last if $j >= $i;
            $count++
        }
        push @smaller, $count;
    }
    return \@smaller;
}

sub countSmaller_B($nums)
{
    use List::Util qw/sum0/;
    my %freq;
    $freq{$_}++ for $nums->@*;

    return [ map { my $i = $_; sum0 @freq{ grep { $_ < $i } keys %freq } } $nums->@* ];
}

sub countSmaller_C($nums)
{
    my @sorted = sort { $a <=> $b } $nums->@*;

    my %smaller;
    my $lessCount = 0;
    while ( defined(my $i = shift @sorted) )
    {
        if ( ! exists $smaller{$i} )
        {
            $smaller{$i} = $lessCount;
        }
        $lessCount++
    }

    return [ @smaller{$nums->@*} ];
}

sub runTest
{
    use Test::More;

    is_deeply( countSmaller_A([8,1,2,2,3]), [4,0,1,1,3], "A Example 1");
    is_deeply( countSmaller_A([6,5,4,8  ]), [2,1,0,3  ], "A Example 2");
    is_deeply( countSmaller_A([2,2,2    ]), [0,0,0    ], "A Example 3");

    is_deeply( countSmaller_B([8,1,2,2,3]), [4,0,1,1,3], "B Example 1");
    is_deeply( countSmaller_B([6,5,4,8  ]), [2,1,0,3  ], "B Example 2");
    is_deeply( countSmaller_B([2,2,2    ]), [0,0,0    ], "B Example 3");

    is_deeply( countSmaller_C([8,1,2,2,3]), [4,0,1,1,3], "C Example 1");
    is_deeply( countSmaller_C([6,5,4,8  ]), [2,1,0,3  ], "C Example 2");
    is_deeply( countSmaller_C([2,2,2    ]), [0,0,0    ], "C Example 3");
    is_deeply( countSmaller_C([0,1,2,3,4]), [0,1,2,3,4], "C Example x");

    done_testing;
}

__END__
sub runBenchmark($repeat)
{
    use Benchmark qw/cmpthese/;
    my @data = map { int(rand(100)) } 1..100;

    cmpthese($repeat, {
        "simple   " => sub { countSmaller_A(\@data) },
        "frequency" => sub { countSmaller_B(\@data) },
        "one pass " => sub { countSmaller_C(\@data) },
    });
}
