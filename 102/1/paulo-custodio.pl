#!/usr/bin/env perl
use v5.36;

my($N) = 2;
print_rare($N);

sub print_rare {
    my($n) = @_;
    for my $r (10**($n-1) .. 10**($n)-1) {
        my $r1 = reverse $r;
        if (perfect_square($r+$r1)) {
            if ($r>=$r1) {
                if (perfect_square($r-$r1)) {
                    say $r;
                }
            }
        }
    }
}

sub perfect_square {
    my($n) = @_;
    my $x = sqrt($n);
    return ($x == int($x));
}
