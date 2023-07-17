#!/usr/bin/env perl
use v5.36;

use List::Util qw/max/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say maxWords(\@ARGV);

sub maxWords($list)
{
    return List::Util::max map { scalar(split(" ", $_)) } @$list;
}

sub runTest
{
    use Test::More;

    is( maxWords(
[ "Perl and Raku belong to the same family.",
  "I love Perl.",
  "The Perl and Raku Conference." ]
            ), 8, "Example 1");

    is( maxWords(
[ "The Weekly Challenge.",
  "Python is the most popular guest language.",
  "Team PWC has over 300 members." ],
            ), 7, "Example 2");

    done_testing;
}

