#!/usr/bin/env perl
use v5.36;

my $bar = "   ^^^^^";
my @pairs = ("  ^     ^", " ^       ^", "^         ^");
my $single = "     ^";

say $bar;
say join "\n", @pairs[0, 1, 2, 2, 2, 2, 2, 1, 0];
say $bar;
say $single for 1..3;
say $bar;
say $single for 1..2;
