#!/usr/bin/env perl
use v5.36;

sub pascal {
    my $row_count = shift;
    my @next = (1);
    for my $num (1..$row_count){
        my $count = @next;
        my $spa = 30 - 2 * $count;
        my $form = (" " x $spa).("%4d" x $count)."\n";
        printf $form, @next;
        @next = (1, (map $next[$_]+$next[$_+1], 0 .. $num-2) ,1);
    }
}
pascal(10);
