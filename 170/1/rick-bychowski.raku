#!/usr/bin/env raku

sub MAIN(Int $n = 9){
    my @primes;
    @primes[^$n] = (1 .. *).map({ $_ if $_.is-prime});
    for 0 .. $n -> $i {
        my @p = @primes[^$i];
        @p.unshift(1);
        my $product = [*] @p;
        my $factors = @p.join("x");
        printf("P(%d) = %-10d  (%s)\n", $i, $product, $factors);
    }
}
