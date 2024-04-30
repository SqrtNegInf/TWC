#!/usr/bin/env perl

use v5.36;

use builtin qw/true false trim/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

say "(", join(", ", map { "'$_'" } uncommon(@ARGV)->@* ), ")";


sub uncommon(@sentenceList)
{
    use Text::ParseWords;
    use List::MoreUtils qw/frequency/;
    my @words = grep { defined } quotewords( '\W+', false, @sentenceList);

    my %freq = frequency(@words);
    my @uncommon = grep { $freq{$_} == 1 } keys %freq;
    return @uncommon ? [  sort @uncommon ] : [ '' ];
}

sub runTest
{
    use Test2::V0 -srand => 1;

    is( uncommon("Mango is sweet", "Mango is sour"), [ qw(sour sweet) ], "Example 1");
    is( uncommon("Mango Mango", "Orange"), [ 'Orange' ], "Example 2");
    is( uncommon("Mango is Mango", "Orange is Orange"), [ '' ], "Example 3");

    done_testing;
}
