#!/usr/bin/env raku

# Get the list of letters from letters.txt.
my @let = <c r a t e>;
# Make all letters lowercase.
@let = map({.trans('A..Z' => 'a..z')}, @let);
# Make a Perl 6 bag of letters so letters and
# words can be compared easily.
my $let = bag @let;


# Read the words from the "words.txt" file
# one at a time.
# Each word is on a separate line.
# Words and letters are matched in a
# case-insensitive way.

my $fn = 'words';
my $fh = open $fn;

for $fh.lines
{
    # Make all word letters lowercase.
    .trans('A..Z' => 'a..z');
    # Make a Perl 6 bag of word letters
    # so letters and word letters can
    # be compared easily.
    my $word = bag $_.comb(/<[a..z]>/);
    # If the word letters are a subset
    # of the letters specified, print the word.
    ($word (<=) $let)  and  say "$_";
}

close $fh;
