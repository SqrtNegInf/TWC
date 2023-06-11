#!/usr/bin/env perl
use v5.36;

use constant NUM_DIVISORS => 8;

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

sub next_number {
    my($n) = @_;

    for (;;) {
        $n++;
        my @divisors = divisors($n);
        return $n if @divisors == NUM_DIVISORS;
    }
}

my $num = shift||10;
my $n = 0;
for (1..$num) {
    $n = next_number($n);
    say $n;
}
