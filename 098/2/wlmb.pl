#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniq);
use List::MoreUtils qw(first_index);

my ($N, @N)= <3 1 2 3 4>;
say "Input: \@N=(", join(", ", @N), ") and \$N=$N\n",
    "Output: ",
    first_index {$_==$N} sort {$a<=>$b} uniq (@N, $N);
