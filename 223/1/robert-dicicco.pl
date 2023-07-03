#!/usr/bin/env perl
use v5.36;

use ntheory qw/is_prime/;

my @input_n = (10,1,20);

for my $n (@input_n) {
    my $num = 0;
    my $cnt = 0;
    say "Input: \$n = $n";
    while ($num < $n){
        if (is_prime($num)) { $cnt++};
        $num++;
    }
    say "Output: $cnt\n";
}
