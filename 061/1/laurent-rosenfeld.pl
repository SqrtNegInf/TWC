#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

my @input = ( 2, 5, -1, 3 );
die "please supply at least two integers" if @input < 2;
my @max = ($input[0] * $input[1], $input[0], $input[1]);
for my $i (1..$#input) {
    @max = ($input[$i] * $input[$i+1], $input[$i], $input[$i+1])
        if $max[0] < $input[$i] * $input[$i+1];
}
say "Max product is $max[0] for values $max[1] and $max[2]";
