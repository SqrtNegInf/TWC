#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;
my $Benchmark = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose, "benchmark:i" => \$Benchmark);
runTest();exit;

my @words1 = split('', shift @ARGV);
my @words2 = split('', shift @ARGV);

say countCommon(\@words1, \@words2);

sub countCommon($words1, $words2)
{
    use List::MoreUtils qw/frequency/;
    my %common = frequency $words1->@*;

    for ( keys %common ) { delete $common{$_} if $common{$_} != 1 }

    for ( $words2->@* ) { $common{$_}++ if exists $common{$_} }

    return scalar( grep { $_ == 2 } values %common);
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( countCommon([ qw(Perl is my friend) ],
                    [ qw(Perl and Raku are friend) ]),         2, "Example 1");
    is( countCommon([ qw(Perl and Python are very similar) ],
                    [ qw(Python is top in guest languages) ]), 1, "Example 2");
    is( countCommon([ qw(Perl is imperative Lisp is functional) ],
                    [ qw(Crystal is similar to Ruby) ]),       0, "Example 3");

    done_testing;
}

