#!/usr/bin/env perl
use v5.36;

my @ARGV = 12;
say "Initial number in base two: ", my $binNr = sprintf("0%b", $ARGV[0]);
say "Next number in base two: ", my $next = (($ARGV[0] % 2) ? ($binNr =~ s!01(1*)$!10$1!r) : ($binNr =~ s!01(1*)(0*)$!10$2$1!r));
say "Next number in base ten: ", eval qq!0b$next!;
