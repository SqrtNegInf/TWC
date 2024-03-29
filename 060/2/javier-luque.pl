#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw /variations/;

my @L = (0, 1, 2, 5);
my $X = 2;
my $Y = 21;
my @answers;

# Brute force the variations
my $variations = variations(\@L, $X);
while (my $v = $variations->next) {
    my $n = join '', @$v;
    $n = int($n);  #Remove leading 0
    push @answers, $n
    	if ($n < $Y && length($n) == $X);
}

say join ', ', sort @answers;
