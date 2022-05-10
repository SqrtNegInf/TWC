#!/usr/bin/env raku

my ($substy-version, $original) = 'The Weekly Perl Challenge' xx 2;
my $matches = $substy-version ~~ s:g/e/E/;
say qq["$original" string becomes "$substy-version",\n\twith {$matches.elems} e's having been uppercased];

