#!/usr/bin/env perl
use v5.36;

use List::Util qw{sum0};

say join "\n", map { join ', ', $_->@* } amicable_pair(1000);
exit;

sub amicable_pair( $n ) {
    my @result;
    for my $x ( 1 .. $n ) {

        # $check is a hashref and exists to ensure that we only cover 
        # every number pair once. 
        # @pair is assigned by sorted $x ,$y so it contains 220, 284 
        # and never 284, 220.
        # $key is @pair joined together, so if "220,284" is covered
        # we go on.

        # given any number x, y equals the sum of the factors for x.
        # and here, z equals the sum of the factors of y.
        # if x == y, that doesn't count, so we take care of that case
        # before we even start looking at z.

        state $check;
        my $y = sum_factors($x);
        next if $x == $y;
        my @pair = sort $x, $y;
        my $key  = join ',', @pair;
        next if $check->{$key}++;
        my $z = sum_factors($y);
        if ( $x == $z ) {
            push @result, \@pair;
        }
    }
    return @result;
}

sub sum_factors ( $n ) {
    my @factors = factor($n);
    return sum0 @factors;
}

sub factor ( $n ) {
    my @factors;
    for my $i ( 1 ..  $n / 2 ) {
        push @factors, $i if $n % $i == 0;
    }
    return @factors;
}
