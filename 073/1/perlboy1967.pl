#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);

my ($S) = 3;

my @S;

# Create list with random integer values
my @A =  (1, 5, 0, 2, 9, 3, 7, 6, 4, 8);

printf "Input:\n\t\@A = (%s)\n\t\$S = %d\n\n", join(', ', @A), $S;

for (my $i = 0; $i < scalar(@A) - $S + 1; $i++) {
  my @s = @A[$i .. $i + $S - 1];

  push(@S, min(@s));

  printf "min(%s) = %d\n", join(', ',@s), $S[-1];
}

printf "\nOutput:\n\t\@S = (%s)\n", join(', ', @S);
