#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw/firstidx/;

sub get_fnr {
    my $input = shift;

    my %fnr_count;
    my @fnr_queue;

    my $result;

    for (split //, $input) {
        my $char = $_;

        $fnr_count{$_}++;

        if ($fnr_count{$_} == 1) {
            push @fnr_queue, $_;
        } else {
            my $pos = firstidx { $_ eq $char }   @fnr_queue;
            splice @fnr_queue, $pos, 1 if defined $pos;
        }

        $result .= scalar @fnr_queue? $fnr_queue[-1] : '#'; 
    }

    return $result;

}

use Test::More;

is(get_fnr('ababc'),'abb#c');
is(get_fnr('xyzzyx'),'xyzyx#');

done_testing;
