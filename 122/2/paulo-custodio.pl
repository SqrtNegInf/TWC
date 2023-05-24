#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';

my $N = shift||4;
show_scores($N);

sub show_scores {
    my($N, @points) = @_;
    my $s = @points ? sum(@points) : 0;
    if ($s > $N) {
    }
    elsif ($s == $N) {
        say "@points";
    }
    else {
        show_scores($N, @points, 1);
        show_scores($N, @points, 2);
        show_scores($N, @points, 3);
    }
}
