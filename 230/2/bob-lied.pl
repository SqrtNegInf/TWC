#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;
my $Prefix  = "";

GetOptions("test" => \$DoTest, "verbose" => \$Verbose, "prefix:s" => \$Prefix);
runTest(); exit;

say countWords($Prefix, @ARGV);

sub countWords($prefix, @wordList)
{
    my $plen = length($prefix);
    my $count = grep { substr($_, 0, $plen) eq $prefix } @wordList;
    return $count;
}

sub runTest
{
    use Test::More;

    is_deeply( countWords("at", qw(pay attention practice attend) ), 2, "Example 1");
    is_deeply( countWords("ja", qw(janet julia java javascript)   ), 3, "Example 2");

    done_testing;
}
