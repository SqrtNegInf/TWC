#!/usr/bin/env perl
use v5.36;
use List::Util qw(reduce);
my @digits= map {split "", $_} # consecutive digits of a Damm table
    qw(0317598642 7092154863 4206871359 1750983426 6123045978
       3674209581 5869720134 8945362017 9438617205 2581436790);
# Organice the digits as a 2D array
my $table=[map {[@digits[10*$_..10*$_+9]]}(0..9)];
# The group operation $n ∗ $m is given by $table->[$n][$m]
say "$_ ", (reduce {$table->[$a][$b]} (0,split "", $_))?"isn't":"is", " correct"  for 5724;
