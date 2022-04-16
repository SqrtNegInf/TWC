#!/usr/bin/env raku

# Perl5 method still works, verbatim
printf "Decimal %2d = Octal %2o\n", $_, $_ for 0..50;

# This is my preferred solution:
say (0..50).fmt('Decimal %1$2d = Octal %2o', "\n");
