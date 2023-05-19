#!/usr/bin/env perl
use v5.36;


use constant {
    MAX_ITER    => 500,
    MAX_NUM     => 10_000_000,
};

sub is_lychrel {
    my($n) = @_;
    for (1 .. MAX_ITER) {
        last if $n > MAX_NUM;
        my $rev_n = 0+reverse($n);
        return 0 if $n == $rev_n;
        $n += $rev_n;
    }
    return 1;
}

say is_lychrel(shift||0);
