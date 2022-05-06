#!/usr/bin/env raku

# Some changes between the challenge assumptions and what this handles:
#
# Words in the word list don't have to be the same length as the start
# and end words.  Words in the list that differ in length from the
# start/end words are just excluded from consideration.
#
# This doesn't care if the words in the list are alphabetical.

my @lines = ('This', 'is', 'a test of the', 'centre function');
say join("\n", center(@lines));

sub center(@lines) {
    my $maxlen = @lines».chars.max;
    return @lines.map( { " " x (($maxlen - $_.chars)/2) ~ $_ } );
}

