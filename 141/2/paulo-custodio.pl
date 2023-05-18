#!/usr/bin/env perl
use v5.36;

use Modern::Perl;

sub numbers {
    my($num) = @_;
    my @ret;

    my $mask_n = 0;
    for (;; $mask_n++) {
        my $mask = sprintf("%0".length($num)."b", $mask_n);
        last if length($mask) > length($num);

        # combine $num with $mask
        my $res = 0;
        for my $i (0 .. length($num)-1) {
            if (substr($mask, $i, 1) eq "1") {
                $res = 10*$res + substr($num, $i, 1);
            }
        }
        push @ret, $res;
    }
    return @ret;
}

my ($m,$n) = (1234, 2);
my $count = 0;
for my $num (numbers($m)) {
    if ($num != 0 && $num != $m) {
        if ($num % $n == 0) {
            $count++;
        }
    }
}
say $count;
