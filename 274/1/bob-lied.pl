#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub goatLatin($sentence)
{
    my $maa = 'ma';
    join ' ',
        map { s/^([^aeiou]?)(.*)$/$2$1/ir  .  ($maa .= 'a') }
        split /\W+/, $sentence
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( goatLatin("I love Perl"),
                  "Imaa ovelmaaa erlPmaaaa", "Example 1");
    is( goatLatin("Perl and Raku are friends"),
                  "erlPmaa andmaaa akuRmaaaa aremaaaaa riendsfmaaaaaa",
                  "Example 2");
    is( goatLatin("The Weekly Challenge"),
                  "heTmaa eeklyWmaaa hallengeCmaaaa", "Example 3");

    done_testing;
}
