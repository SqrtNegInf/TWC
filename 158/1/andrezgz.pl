#!/usr/bin/env perl
use v5.36;

my @additive;

for my $n (2..100) {
    next unless is_prime($n);
    my $sum = 0;
    $sum += $_ for split //, $n;
    push @additive, $n if is_prime($sum);
}

say join ', ', @additive;

sub is_prime {
    my $n = shift;
    #every composite number has a prime factor less than or equal to its square root.
    for (2 .. sqrt $n) {
        return 0 if $n % $_ == 0;
    }
    return 1;
}

__END__

$ ./ch-1.pl
2, 3, 5, 7, 11, 23, 29, 41, 43, 47, 61, 67, 83, 89
