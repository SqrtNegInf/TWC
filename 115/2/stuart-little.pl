#!/usr/bin/env perl
use v5.36;
use warnings;
use v5.12;

# run <script> <space-separated digits>

my @ARGV = (4, 1, 7, 6);
my $attemptedOut = (join "", sort {$b cmp $a} @ARGV) =~ s/(.)([13579]*)$/$2$1/r;
say(($attemptedOut =~ m/[02468]$/) ? ($attemptedOut) : ("No even digits.."));
