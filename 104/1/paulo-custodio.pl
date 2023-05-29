#!/usr/bin/env perl
use v5.36;

my $N = shift // 50;
for my $i (0 .. $N-1) {
    print fusc($i), " ";
}
say "";

sub fusc {
    my($n) = @_;
    state @fusc;
    return $fusc[$n] if defined $fusc[$n];
    return 0 if $n==0;
    return 1 if $n==1;

    if (($n & 1)==0) {      # even
        return $fusc[$n] = fusc($n/2);                      # assign and return
    }
    else {
        return $fusc[$n] = fusc(($n-1)/2) + fusc(($n+1)/2); # assign and return
    }
}
