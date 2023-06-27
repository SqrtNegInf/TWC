#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';

my $n = shift||1;
say sqroot_is_sum_splits($n);

sub get_splits {
    my($n) = @_;
    my @splits;
    add_splits(\@splits, [], $n);
    return @splits;
}

sub add_splits {
    my($splits, $path, $rest) = @_;
    if ($rest eq '') {
        push @$splits, [@$path];
    }
    else {
        for my $i (1..length($rest)) {
            my $a = substr($rest, 0, $i);
            my $b = substr($rest, $i);
            add_splits($splits, [@$path, $a], $b);
        }
    }
}

sub sqroot_is_sum_splits {
    my($n) = @_;
    my $sq = sqrt($n);
    return 0 if int($sq) != $sq;        # not pefect square
    for (get_splits($n)) {
        my @split = @$_;
        return 1 if sum(@split) == $sq;
    }
    return 0;
}
