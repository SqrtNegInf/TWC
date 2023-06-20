#!/usr/bin/env perl
use v5.36;

sub divisors {
    my($n) = @_;
    my(@div_low, @div_high);
    for (my $i = 1; $i <= sqrt($n); $i++) {
        if ($n%$i == 0) {
            push @div_low, $i;
            unshift @div_high, $n/$i if $n/$i != $i;
        }
    }
    return (@div_low, @div_high);
}

sub proper_divisors {
    my($n) = @_;
    my @div = divisors($n);
    return @div[0..$#div-1];
}

sub sum {
    my $sum = 0;
    $sum += $_ for @_;
    return $sum;
}

sub amicable_pair_iter {
    my $n = 1;
    return sub {
        while (1) {
            $n++;               # start at 2
            my $sum = sum(proper_divisors($n));
            if (sum(proper_divisors($sum))==$n && $n < $sum) {
                return ($n, $sum);
            }
        }
    };
}

my $iter = amicable_pair_iter();
say "(", join(",", $iter->()), ")";
