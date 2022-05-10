#!/usr/bin/env raku

# Methodology:
#   m:g/e/ will return an array of matches
#   S:g/e/E Non-destructively returns a new string with the replacement

my $orig    = 'Perl Weekly Challenge';
my $new     = S:g/e/E/ with $orig;
my @matches = $orig ~~ m:g/e/;

say $new;
say "Number off 'e' characters: " ~ @matches.elems;
