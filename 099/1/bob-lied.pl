#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $doTest =1;
GetOptions("test" => \$doTest);
runTest(); exit;

sub Usage { "$0 'string' 'pattern'" }

my $S = shift;
my $P = shift;
die Usage() unless $S;
die Usage() unless $P;

say patternMatch($S, $P);

sub patternMatch($s, $p)
{
    # Convert glob metacharacters to regex equivalents.
    $p =~ s/\*+/.*/g;
    $p =~ s/\?/./g;

    # Anchor to match whole string.  Use /s to match embedded newlines.
    return $s =~ m/^$p$/s || 0;
}

sub runTest
{
    use Test::More;

    is( patternMatch("abcde", "a*e"),     1);
    is( patternMatch("abcde", "a*d"),     0);
    is( patternMatch("abcde", "?b*d"),    0);
    is( patternMatch("abcde", "a*c?e"),   1);
    is( patternMatch("ab\nde", "ab?de"),  1);
    is( patternMatch("ab\nde", "ab*de"),  1);

    done_testing;
}
