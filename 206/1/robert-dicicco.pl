#!/usr/bin/env perl
use v5.36.0;
use strict;
use warnings;
use feature "say";
use Algorithm::Combinatorics qw(permutations combinations);

my @times = (["00:00", "23:55", "20:00"],["01:01", "00:50", "00:57"],["10:10", "09:30", "09:00", "09:55"]);

sub ToMins {
    my $a = shift;
    if (@$a[0] eq "00:00") { @$a[0] = "24:00"};
    if (@$a[1] eq "00:00") { @$a[1] = "24:00"};
    my ($hrs, $mins) = split(":",@$a[0]);
    my $t0_mins = ($hrs * 60) + $mins;
    ($hrs, $mins) = split(":",@$a[1]);
    my $t1_mins = ($hrs * 60) + $mins;
    return(abs($t0_mins - $t1_mins));
}

for my $tm (@times) {
    print("Input: \@time = \(",@$tm,"\)\n");
    my $shortest = 1441;
    my $iter = combinations($tm, 2);
    while (my $c = $iter->next) {
        my @arr = ();
        push(@arr,@$c[0]);
        push(@arr,@$c[1]);
        my $diff = ToMins(\@arr);
        if ( $diff < $shortest) {$shortest = $diff};
    }
    print("Output: $shortest\n\n");
}
