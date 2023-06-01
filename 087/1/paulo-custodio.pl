#!/usr/bin/env perl
use v5.36;

my @seq = longest_seq(my @N = (100, 4, 50, 3, 2));
if (@seq) {
    say "(", join(", ", @seq), ")";
}
else {
    say 0;
}

sub longest_seq {
    my(@n) = @_;
    my @seq;

    # sort the sequence
    @n = sort {$a<=>$b} @n;

    # look for sequences of consecutive numbers
    while (@n) {
        my $i = 0;
        while ($i < @n && $n[$i] == $n[0]+$i) {
            $i++;
        }
        my @got = splice(@n, 0, $i);    # [0..i[ is a sequence
        if (@got > 1 && @got > @seq) {
            @seq = @got;                # found a longer sequence
        }
    }

    return @seq;
}
