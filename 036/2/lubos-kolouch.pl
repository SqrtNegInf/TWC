#!/usr/bin/env perl
use v5.36;

use Math::Combinatorics;

my $weight_limit = 15;
my %weight = (
    "R" => 1,
    "B" => 1,
    "G" => 2,
    "Y" => 12,
    "P" => 4,);

my %value = (
    "R" => 1,
    "B" => 2,
    "G" => 2,
    "Y" => 4,
    "P" => 10,);

sub calculate_value {
    my $combo = shift;
    my $total_we;
    my $total_va;
        
    for (@$combo) {
        $total_we += $weight{$_};
        $total_va += $value{$_};
    }

    return $total_va if $total_we <= $weight_limit;

    return 0;
}


# --------- MAIN ---------
my @list = qw/R G B Y P/;

for my $count ( 1 .. scalar @list ) {
    my $max_value = 0;
    my $max_boxes;

    my $combinat = Math::Combinatorics->new(
        count => $count,
        data  => [@list],
    );

    while ( my @combo = $combinat->next_combination ) {
        my $boxes = join( ' ', sort @combo );
        my $val = calculate_value(\@combo);
        if ($val > $max_value) {
            $max_value = $val;
            $max_boxes = $boxes;
        }
    }

    if ($max_value) {
        say "Best combination for $count boxes is $max_boxes with value $max_value" unless $count == 2; # that one varies
    } else {
        say "There is no possible combination for $count boxes under or equal weight $weight_limit";
    }
}

