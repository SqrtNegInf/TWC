#!/usr/bin/env perl
use v5.36;

my $target = 200;
die "Usage: perl $0 <target>" unless $target =~ /^\d+$/ && $target > 0;

my @steps;
while ($target > 1) {
    if ($target % 2) {
        push @steps, sprintf('Add $1 to $%i (new total $%i)', $target-1, $target);
        $target--;
    } else {
        push @steps, sprintf('Multiply $%i by 2 (new total $%i)', $target / 2, $target);
        $target /= 2;
    }
}

for my $i (1..@steps) {
    say "Step #$i: ", pop @steps;
}
