#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;
my $Separator = " ";

GetOptions("test" => \$DoTest, "verbose" => \$Verbose, "sep:s" => \$Separator);
runTest();exit;

say join ",", map { qq("$_") } splitStrings(\@ARGV, $Separator)->@*;

sub splitStrings($words, $separator)
{
    my @output = grep !/\A\Z/, map { split /\Q$separator\E+/, $_ } $words->@*;
    return \@output;
}

sub runTest
{
    use Test::More;

    is_deeply( splitStrings( ["one.two.three", "four.five", "six" ], "." ),
                      [ qw(one two three four five six) ], "Example 1");
    is_deeply( splitStrings( [ '$perl$$', '$$raku$' ], '$' ),
                      [ qw( perl raku ) ], "Example 1");

    is_deeply( splitStrings( [ qw(a b c) ],         '/' ),  [ qw(a b c) ], "No separator");
    is_deeply( splitStrings( [ "////", "//", "/", ], "/" ), [ ],           "No words");

    done_testing;
}
