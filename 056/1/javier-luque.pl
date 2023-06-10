#!/usr/bin/env perl
use v5.36;

my @N = (2, 7, 9);
my $k = 2;

for (my $i = 0; $i < scalar(@N); $i++) {
    for (my $j = 0; $j < scalar(@N); $j++) {
    	next if $i == $j;
    	say "$i, $j" if ($N[$i] - $N[$j] == $k);
    }
}
