#!/usr/bin/env raku

use Test;

class box {
    has Str $.colour;
    has Int $.weight;
    has Int $.amount;
}

my $box=box.new(colour => 'R', weight => 1, amount => 1 );
my @boxes=
    box.new(colour => 'R', weight => 1 , amount => 1 ),
    box.new(colour => 'B', weight => 1 , amount => 2 ),
    box.new(colour => 'G', weight => 2 , amount => 2 ),
    box.new(colour => 'Y', weight => 12, amount => 4 ),
    box.new(colour => 'P', weight => 4 , amount => 10),
;

# calculate all possible permutations of n boxes
# simple integers are permutated rather than create multiple objects
my @combinations=(^@boxes.elems).combinations;

my $max_weight=15;
my $max_boxes=@boxes.elems;

sub knapsack(@combinations,@boxes,$max_weight,$max_boxes) {
    my @cands= gather for @combinations -> @c {

        # prune combinations with more than max boxes
        next unless @c.elems <= $max_boxes;

        my $w= @boxes[@c]>>.weight.sum;

        # prune overweight combinations
        next unless $w <= $max_weight;

        # cache for later
        my %wv= comb => @c, w => $w, v => @boxes[@c]>>.amount.sum;
        take %wv;
    }
    # sort in descending order - highest value first.
    @cands.=sort({$^a<v> <= $^b<v>});

    return @cands[0];
}

my %best_value= knapsack(@combinations, @boxes, $max_weight, $max_boxes);
say "(max boxes $max_boxes, max weight $max_weight)";
say "Best boxes are "~ (@boxes[$_].colour for flat %best_value<comb>).sort.join(" ");
say "total weight: {%best_value<w>}Kg, value: £{%best_value<v>}";

# bonus task
my $best_num_boxes=0;
my $best_GBP_value=0;
my %best;

for 2..4 -> $max_boxes {
    my %best_value = knapsack(@combinations, @boxes, $max_weight, $max_boxes);
    #     say "\n(max boxes $max_boxes, max weight $max_weight)";
    #     say "Best boxes are "~ (@boxes[$_].colour for flat %best_value<comb>).sort.join(" ");
    #     say "total weight: {%best_value<w>}Kg, value: £{%best_value<v>}";
    if %best_value<v> > $best_GBP_value {
        $best_GBP_value = %best_value<v>;
        %best=%best_value;
        $best_num_boxes = $max_boxes;
    }
}

say "\nBonus\nOptimal number of boxes to maximise value for 2 to 4 boxes is: \n$best_num_boxes with {%best<w>}Kg, value: £{%best<v>}";

