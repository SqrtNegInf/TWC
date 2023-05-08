#!/usr/bin/env perl

use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

#binmode(STDOUT, ':utf8');
#binmode(STDERR, ':utf8');

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say oddOneOut(@ARGV);

sub isOrdered($word)
{
    use Unicode::Collate;
    state $Collator = Unicode::Collate->new();

    my @char = split(//, lc($word));
    my $first = shift @char;
    while ( my $next = shift @char )
    {
        return false if $Collator->gt($first, $next) > 0;
        $first = $next;
    }
    return true;
}

sub oddOneOut(@words)
{
    use List::Util qw/all/;

    return 0 unless @words;
    my $wordLength = length($words[0]);
    return 0 unless all { length($_) == $wordLength } @words;

    my $removeCount = grep { not isOrdered($_) } @words;

    return $removeCount;
}

sub runTest
{
    use Test::More;

    is(oddOneOut(               ), 0, "Empty list");
    is(oddOneOut('', '', ''     ), 0, "Empty strings");
    is(oddOneOut(qw(xyzz       )), 0, "One word sorted");
    is(oddOneOut(qw(xyzzy      )), 1, "One word out");
    is(oddOneOut(qw(abc xyz tsu)), 1, "Example 1");
    is(oddOneOut(qw(rat cab dad)), 3, "Example 2");
    is(oddOneOut(qw(x   y   z  )), 0, "Example 3");
    is(oddOneOut(qw(xyz de  m  )), 0, "Different lengths");
   #is(oddOneOut(qw(mío año del)), 1, "Spanish");

    done_testing;
}

