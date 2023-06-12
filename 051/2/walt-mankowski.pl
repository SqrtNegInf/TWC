#!/usr/bin/env perl
use v5.36;

use List::Util qw(product);

sub is_colorful($n) {
    my %prods;
    for my $len (1..length($n)) {
        for my $i (0..length($n) - $len) {
            my $p = product split //, substr($n, $i, $len);
            if (defined $prods{$p}) {
                return 0;
            } else {
                $prods{$p} = 1;
            }
        }
    }
    return 1;
}

for my $n (100..999) {
    say $n if is_colorful($n);
}
