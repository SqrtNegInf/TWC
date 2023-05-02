#!/usr/bin/env perl

use v5.36;

my (@tests, $test);

@tests = qw[Perl PWC PyThon raku   Byron ShakesSpeare miltoN KEATS 123 6-fold Hello! a A];

# loop over tests
 while ($test = shift @tests) {
 	 say qq[\nInput:  $test\nOutput: ] . ($test =~ m/^[A-Z]?([a-z]*|[A-Z]*)$/ ? 1 : 0);
}
