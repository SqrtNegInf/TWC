#!/usr/bin/env perl
use v5.36;

my %boxes = (
    "R" => { "w" => 1,  val => 1  },
    "B" => { "w" => 1,  val => 2  },
    "G" => { "w" => 2,  val => 2  },
    "Y" => { "w" => 12, val => 4  },
    "P" => { "w" => 4,  val => 10 },
);
my $start_nb_boxes = shift // 5;
my $max_val = 0;
my $max_boxes;

sub try_one {
    my ($cur_weight, $cur_val, $num_boxes, $boxes_used, $last_box_used, @boxes_left) = @_;
    if ($cur_val > $max_val) {
        $max_val = $cur_val;
        $max_boxes = $boxes_used;
    }
    for my $box (@boxes_left) {
        next if $box lt $last_box_used;
        my $new_cur_weight = $cur_weight + $boxes{$box}{w};
        next if $new_cur_weight > 15 or $num_boxes <= 0;
        my @new_boxes_left = grep $_ ne $box, @boxes_left;
        my $new_box_used = $boxes_used ? $boxes_used . "-$box" : $box;
        try_one ($new_cur_weight, $cur_val + $boxes{$box}{val}, $num_boxes -1, $new_box_used, $box, @new_boxes_left);
    }
}
try_one (0, 0, $start_nb_boxes, "", "A", sort keys %boxes);
say "Max: $max_val, Boxes:  $max_boxes";
