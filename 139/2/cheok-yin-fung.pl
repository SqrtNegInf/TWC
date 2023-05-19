#!/usr/bin/env perl
use v5.36;

use Math::BigInt;
use ntheory 'primes';

my $num = $ARGV[0] || 5;

# pre-complied file, excluding 2, 3 and 5

#open FI, "primes_upto_1000.txt";
#chomp(my @primes = <FI>);
my @primes = @{primes( 1000 )}; #get_primes;

sub proper_factors {
    my $n = $_[0];
    my @factors = ();
    for (2..int sqrt($n)) {
        push @factors, $_, $n/$_ if $n % $_ == 0;
    }
    return [@factors];
}

sub verify {
    my $p = $_[0];
    my $ones = Math::BigInt->new("1" x ($p-1));
    if ($ones->bmod($p) == 0) {
        for my $k (@{proper_factors($p-1)}) {
            my $ones_sub = Math::BigInt->new("1" x $k);
            return 0 if $ones_sub->bmod($p) == 0;
        }
        return 1;
    }
    return 0;
}

my $count = 0;
for (@primes) {
    if (verify $_) {
        say $_;
        $count++;
    }
    last if $count == $num;
}
