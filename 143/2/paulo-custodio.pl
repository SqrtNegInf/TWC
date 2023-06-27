#!/usr/bin/env perl
use v5.36;

sub is_stealthy {
    my($n) = @_;
    for my $a (1..$n) {
        if ($n % $a == 0) {
            my $b = $n / $a;            # a*b=n
            for my $c (1..$n) {
                if ($n % $c == 0) {
                    my $d = $n / $c;    # c*d=n
                    if ($a+$b==$c+$d+1) {
                        return 1;
                    }
                }
            }
        }
    }
    return 0;
}

my $n = shift//36;
say is_stealthy($n);
