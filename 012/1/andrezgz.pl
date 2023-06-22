#!/usr/bin/env perl
use v5.36;

my $n = 0;
my $mult = 1;

while(++$n){
    if ( is_prime($n) ) {
        $mult *= $n;
        last unless(is_prime($mult + 1));
    }
}
print $mult+1;

sub is_prime {
    my $n = shift;
    my $upto = int($n / 2); #Divisors are <= n/2
    return 1 == grep {$n % $_ == 0} (1 .. $upto);
}
