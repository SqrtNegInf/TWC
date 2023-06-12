#!/usr/bin/env perl
use v5.36;

use List::Util qw(all uniq);

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
exit(!runTest()) if $DoTest;

sub commonCharacters($list)
{
    my @lcList = map { lc } @$list;
    my $firstWord = shift @lcList;
    my @possible = uniq sort split //, $firstWord;

    sub isEverywhere($c, $words) { all {index($_, $c) >= 0  } @$words };

    my @common = grep { isEverywhere($_, \@lcList) } @possible;

    return \@common;
}

sub runTest
{
    use Test2::V0;

    is(commonCharacters( [ qw(Perl Rust Raku) ] ), [ qw(r) ], "Example 1");
    is(commonCharacters( [ qw(love live leave)] ), [ qw(e l v) ], "Example 1");

    done_testing;
}
