#!/usr/bin/env perl
use v5.36;

my @primes;
my $c = 1;
my $n = 2;

while (1) {
    if ( is_prime($n) ) {
        if ( $c == 10001 ) {
            say join "\t", $c, $n if $c == 10001;
            exit;
        }
        $c++;
    }
    $n++;
}

sub is_prime ($n) {
    for ( 2 .. sqrt $n ) { return unless $n % $_ }
    return 1;
}
