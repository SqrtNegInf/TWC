#!/usr/bin/env perl

use Modern::Perl;

say candies((1, 4, 3, 2));

sub candies {
    my(@N) = @_;
    my @candy;
    for my $i (0 .. $#N) {
        $candy[$i]++;
        $candy[$i]++ if $N[$i] > ($i>0   ? $N[$i-1] : $N[$i]);
        $candy[$i]++ if $N[$i] > ($i<$#N ? $N[$i+1] : $N[$i]);
    }
    return sum(@candy);
}

sub sum {
    my($sum, @a) = @_;
    $sum += $_ for @a;
    return $sum;
}
