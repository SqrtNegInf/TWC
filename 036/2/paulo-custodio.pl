#!/usr/bin/env perl
use v5.36;

use Math::Combinatorics;
use List::Util qw( sum );

my $max_weight = 15;

{
    package Box;
    use Object::Tiny qw( color weight amount );
}

# possible boxes
my @boxes = (
    Box->new( color => 'R', weight => 1, amount => 1 ),
    Box->new( color => 'B', weight => 1, amount => 2 ),
    Box->new( color => 'G', weight => 2, amount => 2 ),
    Box->new( color => 'Y', weight => 12, amount => 4 ),
    Box->new( color => 'P', weight => 4, amount => 10 ),
);

# all combinations
my $max_amount = 0;
my @max_combo;
for my $k (1 .. scalar(@boxes)) {
    my $combinat = Math::Combinatorics->new(count => $k, data => \@boxes);
    while (my @combo = $combinat->next_combination) {
        my $total_weight = sum(map {$_->weight} @combo);
        my $total_amount = sum(map {$_->amount} @combo);
        if ($total_weight <= $max_weight) {
            if ($total_amount > $max_amount) {
                $max_amount = $total_amount;
                @max_combo = @combo;
            }
        }
    }
}

say join("", sort map {$_->color} @max_combo);
