#!/usr/bin/env perl
use v5.36;

sub sum_divisors {
    my $n = shift;
    my $sum = 0;
    foreach my $i (1 .. $n/2) {
        $sum += $i if $n % $i == 0;
    }
    return $sum;
}

my $n1 = 2;
my $n2;
my @already_checked;

while (!$n2) {
    my $sum = sum_divisors($n1);
    if (!grep(/^$sum$/, @already_checked) && $sum != $n1 && sum_divisors($sum) == $n1) {
        $n2 = $sum;
    }
    push @already_checked, $sum, $n1++;
}
$n1--;

print "($n1, $n2)\n";
