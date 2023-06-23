#!/usr/bin/env perl
use v5.36;

my $perfect = 0;
my $n = 2;

while ($perfect < 5) {
    if (is_prime($n) && is_prime(2**$n-1)) {
        print 2**($n-1) * (2**$n - 1).$/;
        $perfect++;
    }
    $n++;
}

sub is_prime {
    my $n = shift;
    return 1 == grep {$n % $_ == 0} (1 .. $n-1);
}
