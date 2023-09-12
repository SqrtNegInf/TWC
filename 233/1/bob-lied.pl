#!/usr/bin/env perl
use v5.36;

use List::Util qw/uniq/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say similarWords(@ARGV);

sub wordHash($word)
{
    join "", uniq sort { $a cmp $b } split(//, $word)
}

sub similarWords(@wordList)
{
    my %similar;
    for my $word ( @wordList )
    {
        # Could just increment a count, but saving the word makes it
        # possible to see the list of similar words
        push @{$similar{wordHash($word)}}, $word;
    }

    if ( $Verbose )
    {
        my $group = 1;
        for my $h (keys %similar)
        {
            my $n = scalar $similar{$h}->@*;
            next unless $n > 1;
            say "Group $group ($n -> ", $n*($n-1)/2," pairs): ", join(" ", $similar{$h}->@*);
        }
    }

    # The number of pairs from a list is the combination of N things taken
    # 2 at a time, or N(N-1)/2 = (N^2 -N)/2
    my $pairCount = 0;
    for my $h ( keys %similar)
    {
        my $n = scalar $similar{$h}->@*;
        next unless $n > 1;
        $pairCount += $n*($n-1) / 2;
    }
    return $pairCount;
}

sub runTest
{
    use Test2::V0;

    is(similarWords( qw(aba aabb abcvd bac aabc) ), 2, "Example 1");
    is(similarWords( qw(aabb ab ba             ) ), 3, "Example 2");
    is(similarWords( qw(nba cba dba            ) ), 0, "Example 3");


    is(similarWords( "", qw(nba cba dba            ) ), 0, "Zero length word");
    is(similarWords( "", qw(bba aba dba            ) ), 1, "Zero length word with a pair`");

    is(similarWords( qw(abc abc abc abc        ) ), 6, "Duplicates");

    done_testing;
}
