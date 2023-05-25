#!/usr/bin/env perl
use v5.36;

sub bin2dec {
    my $bin = shift;
    my $sum = 0;
    for my $i (split //, $bin) {
        $sum = $sum * 2 + $i;
    }
    return $sum;
}

for my $test (254, 101, 18) {
    my $b2 = sprintf "%08b", $test;
    $b2 =~ s/(\d{4})(\d{4})/$2$1/;
    say bin2dec $b2;;
}
