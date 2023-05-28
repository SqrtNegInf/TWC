#!/usr/bin/env perl
use v5.36;

my @N = <1 3 8 2 0>;

my $max_dif = 0;

if ($#N != 0) {selection_sort();}

print $max_dif, "\n";

sub max_ind {
    my @arr = @_;
    my $max = $arr[0];
    my $max_i = 0;
    for my $i (1..$#arr) {
        if ($arr[$i] > $max) {
            $max_i = $i;
            $max = $arr[$i];
        }
    }
    return $max_i;
}

sub selection_sort {
    swap_arr_N(0, max_ind(@N));
    for my $i (1..$#N) {
        swap_arr_N($i, $i+max_ind(@N[$i..$#N]));
        my $dif = $N[$i-1] - $N[$i];
        $max_dif = $dif if $dif > $max_dif;
    } 
}

sub swap_arr_N {
    ($N[$_[0]], $N[$_[1]]) = ($N[$_[1]], $N[$_[0]]) if $_[0]!=$_[1];
}
