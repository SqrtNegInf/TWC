#!/usr/bin/env raku

# run <script> <number>

my $arg = 12;
say "Initial number in base two: ", my $binNr = sprintf("0%b", $arg);
say "Next number in base two: ", my $next = (($arg % 2) ?? (S!01(1*)$!10$0! with $binNr) !! (S!01(1*)(0*)$!10$1$0! with $binNr));
say "Next number in base ten: ", parse-base($next,2);


