#!/usr/bin/env raku

my $string="Perl Weekly Challenge";
put "Original string: $string";
put "Total replacements performed: ", (s:g/e/E/).elems given $string;
put "Modified string: $string"
