#!/usr/bin/env perl
use v5.36;

use ntheory qw/divisors powmod is_prime/;

my $cnt        = 0;
my $test_prime = 1;

#print("Enter the number of primes to find : ");

my $limit = 5; #<STDIN>;
chomp($limit);

print("Finding $limit Long Primes\n");
while ( 1 == 1 ) {
    my $ret = long_prime($test_prime);
    if ( $ret > 0 ) {
        $cnt++;
        print("$cnt. $test_prime\n");
        if ( $cnt == $limit ) {
            say "Goodbye !";
            last;
        }
    }

    $test_prime++;
}

sub long_prime {
    my ($p) = @_;
    return 0 unless is_prime($p);

    for my $d ( divisors( $p - 1 ) ) {
        return $d + 1 == $p if powmod( 10, $d, $p ) == 1;
    }

    return (0);
}
