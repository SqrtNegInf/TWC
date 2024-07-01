#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $DoTest  = 0;
my $Benchmark = 0;

GetOptions("test" => \$DoTest, "benchmark:i" => \$Benchmark);
runTest();exit;

say brokenKeys(@ARGV);

sub brokenKeys($sentence, @keys)
{
    my @s = split(/\W+/, $sentence);
    for my $broken ( @keys )
    {
        @s = grep !/$broken/i, @s;
    }
    return scalar(@s);
}

sub bk($sentence, @keys)
{
    # my $re = '^[^' . join("", @keys) . ']*$';
    # return scalar grep /$re/i, split(/\W+/, $sentence);
    # my $re = '[' . join("", @keys) . ']';
    my $re;
    { local $, = ''; $re = qq([@keys]); }
    my @s = split(/\W+/, $sentence);
    return scalar(@s) - ( grep /$re/i, @s );
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( brokenKeys("Perl Weekly Challenge",    'l', 'a'), 0, "Example 1");
    is( brokenKeys("Perl and Raku",            'a'     ), 1, "Example 2");
    is( brokenKeys("Well done Team PWC",       'l', 'o'), 2, "Example 3");
    is( brokenKeys("The joys of polyglottism", 'T'     ), 2, "Example 4");

    is( bk("Perl Weekly Challenge",    'l', 'a'), 0, "Example 1 bk");
    is( bk("Perl and Raku",            'a'     ), 1, "Example 2 bk");
    is( bk("Well done Team PWC",       'l', 'o'), 2, "Example 3 bk");
    is( bk("The joys of polyglottism", 'T'     ), 2, "Example 4 bk");

    done_testing;
}
