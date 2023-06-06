#!/usr/bin/env perl
use v5.36;
srand 1;

my $n = 20;
my %unique;
my @items;
while (%unique < $n) {
    my $element = int(rand(50) + 1);
    push @items, $element unless exists $unique{$element};
    $unique{$element} = 1
}

say "Original list: @items";
my @peaks;
push @peaks, $items[0] if $items[0] > $items[1];
for my $i (1..$#items - 1) {
    push @peaks, $items[$i] if $items[$i] > $items[$i-1]
        and $items[$i] > $items[$i+1];
}
push @peaks, $items[-1] if $items[-1] > $items[-2];
say "Peaks: @peaks";
