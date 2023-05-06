#!/usr/bin/env perl
use v5.36;
sub is_disarium {
    my $num = shift;
    my @digits = split '', $num;
    my $i = 1;
    my $sum = 0;
    $sum += $_ for map {  $_ ** $i++ } @digits;
    return $num == $sum;
}
my $i = 0;
my $count = 0;
while ($count < 18) {
    say $i and $count++ if is_disarium $i;
    $i++;
}
