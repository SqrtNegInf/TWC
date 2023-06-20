#!/usr/bin/env perl
use v5.36;

use Math::Prime::XS qw/is_prime/;

sub get_amicable {
    my $n = shift;

    # Thābit ibn Qurra theorem
    my $p = 3 * 2**( $n - 1 ) - 1;
    return 0 unless is_prime($p);

    my $q = 3 * 2**($n) - 1;
    return 0 unless is_prime($q);

    my $r = 9 * 2**( 2 * $n - 1 ) - 1;
    return 0 unless is_prime($r);

    return ( 2**($n) * $p * $q, 2**($n) * $r );
}

###### MAIN ######

# must start with n>1
my $candidate = 2;

while (1) {
    if ( my (@result) = get_amicable($candidate) ) {
        say 'Pair found: ' . join qq/,/, @result;
        last;
    }

    $candidate++;
}

###### TESTS ######

use Test::More;

my @got = get_amicable(2);
my @expected = ( 220, 284 );
is_deeply( \@got, \@expected, 'Test 2' );

@got      = get_amicable(3);
@expected = (0);
is_deeply( \@got, \@expected, 'Test 3' );

@got = get_amicable(4);
@expected = ( 17_296, 18_416 );
is_deeply( \@got, \@expected, 'Test 4' );

@got      = get_amicable(5);
@expected = (0);
is_deeply( \@got, \@expected, 'Test 5' );

done_testing;
