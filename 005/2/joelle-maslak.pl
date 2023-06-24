#!/usr/bin/env perl
use v5.36;

if ( @ARGV > 1 )      { die("Provide (optionally) filename and nothing else") }

my $filename = $ARGV[0] // 'words';

my %wordseen;
my %wordcache;
my $maxcnt = 0;
my $maxword = '';

open my $fh, '<', $filename;
while (my $word = <$fh>) {
    chomp($word);
    $word = fc($word);
    next if (exists $wordseen{$word});  # We do not consider a change in case an anagram
    $wordseen{$word} = 1;

    my $matchkey = join '', sort split '', $word;
    my $cnt = ($wordcache{$matchkey} // 0) + 1;
    $wordcache{$matchkey} = $cnt;

    if ($cnt > $maxcnt) {
        $maxcnt = $cnt;
        $maxword = $word;
    } elsif ($cnt == $maxcnt) {
        $maxword = "$maxword | $word";  # For where TWO OR MORE words have same # of anagrams
    }
}

say "Best sequence ($maxcnt anagrams): $maxword";

