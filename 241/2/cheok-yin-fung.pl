#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw/factor/;

sub cp_two_same_size_arr {
    my @arr0 = $_[0]->@*;
    my @arr1 = $_[1]->@*;
    for (0..$#arr0) {
        return -1 if $arr0[$_] < $arr1[$_]; 
        return 1 if $arr0[$_] > $arr1[$_]; 
    }
}

sub po {
    my @nums = @_;
    my %f;
    for (@nums) {
        $f{$_} = [factor $_];
    }
    my @n_nums = sort { 
        if ($f{$a}->@* < $f{$b}->@*) {
            return -1;
        } elsif ($f{$a}->@* > $f{$b}->@*) {
            return 1;
        } else {
            cp_two_same_size_arr($f{$a}, $f{$b})
        } 
      } @nums;
    return [@n_nums];
}

use Test::More tests=>1;
use Test::Deep;
cmp_deeply po(11,8,27,4,12,18), [11,4,8,12,18,27];
