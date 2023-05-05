#!/usr/bin/env perl
use v5.36;

sub gcd {
    my ($i, $j) = sort { $a <=> $b } @_;
    while ($j) {
        ($i, $j) = ($j, $i % $j);
    }
    return $i;
}
sub is_perfect_totient {
    my $num = shift;
    my $n = $num;
    my $sum = 0;
    while ($n >= 1) {
        $n = scalar grep { gcd( $n, $_) == 1 } 1..$n-1;
        $sum += $n;
    }
    return $num == $sum;
}
my $count = 0;
my $n = 1;
while ($count < 10) {
    print "$n " and $count++ if is_perfect_totient $n;
    $n++;
}
say "";
