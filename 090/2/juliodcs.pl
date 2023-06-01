#!/usr/bin/env perl
use v5.36;

use List::Util 'sum0';

my ($first, $second) = (238, 13);

#die 'Please input 2 numbers' if not @ARGV == 2;

say "Ethiopian multiplication of $first and $second\n";

sub operate(@items) {
    my $last = @items[@items - 1];
    
    $last->[0] == 1
        ? @items
        : operate (@items, [int($last->[0] / 2), $last->[1] * 2])
}

my @steps = operate([$first, $second]);
say 'Steps:';
say join ', ', $_->@* for @steps;

say "\nKepp odd numbers:";
my @odd = grep { $_->[0] % 2 } @steps;
say join ', ', $_->@* for @odd;

say "\nKeep right values:";
my @right = map { $_->[1] } @odd;
say $_ for @right;

say "\nAdd the numbers:";
say sum0 @right;
