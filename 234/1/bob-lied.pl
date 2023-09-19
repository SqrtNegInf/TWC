#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub commonCharacters(@words) {
    use List::Util qw/all/;

    return [] unless @words;
    my $start = shift @words;
    my @result;
  LETTER:
    for my $letter ( split(//, $start) )
    {
        if ( all { index($_, $letter) >= 0 } @words )
        {
            # This letter occurs in all words.
            push @result, $letter;

            # Remove the letter from each word
            for my $w ( 0 .. $#words)
            {
                my $pos = index($words[$w], $letter);
                substr($words[$w], $pos, 1, ""); # Remove the letter
                last LETTER if $words[$w] eq "";
            }
        }
    }
    return \@result;
}


sub runTest
{
    use Test::More;

    is_deeply( commonCharacters("java", "javascript", "julia"), ["j", "a"],      "Example 1");
    is_deeply( commonCharacters("bella", "label", "roller"),    ["e", "l", "l"], "Example 2");
    is_deeply( commonCharacters("cool", "lock", "cook"),        ["c", "o"],      "Example 3");

    is_deeply( commonCharacters("abc", "def", "xyz"),        [],       "No common");
    is_deeply( commonCharacters("ghi", "ghi", "ghi"), ["g", "h", "i"], "All common");
    is_deeply( commonCharacters("one"), ["o", "n", "e"], "One word");
    is_deeply( commonCharacters(), [], "Empty list");

    done_testing;
}
