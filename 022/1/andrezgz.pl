#!/usr/bin/env perl
use v5.36;

use constant LIMIT => 10;

my $n = 0;
my $pairs = 0;
my %primes;

do {{ # double block to allow next within do until
    next if (!is_prime(++$n));      # only primes allowed
    $primes{$n}=1;

    if(exists $primes{$n-6}) {
        print sprintf("(%d,%d)\n",$n-6,$n);
        $pairs++;
    }
}} until ($pairs == LIMIT);

sub is_prime {
    my $n = shift;
    return 0 if $n <= 1;
    #every composite number has a prime factor less than or equal to its square root.
    return 1 == grep {$n % $_ == 0} (1 .. sqrt $n);
}
