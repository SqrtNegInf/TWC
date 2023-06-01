#!/usr/bin/env perl
use v5.36;

sub list_product{
    my @numbers = @_;
    my $product = 1;
    map {$product *= $_ } @numbers;
    return $product;
}

MAIN:{
    my(@N, @M);
    @N = (5, 2, 1, 4, 3);
    for my $i (0 .. (@N - 1)){
        my @numbers = @N[0 .. $i - 1, $i+1 .. (@N - 1)];
        push @M, list_product(@numbers);
    }
    print "(" . join(", ", @M) . ")\n";
    @M = ();
    @N = (2, 1, 4, 3);
    for my $i (0 .. (@N - 1)){
        my @numbers = @N[0 .. $i - 1, $i+1 .. (@N - 1)];
        push @M, list_product(@numbers);
    }
    print "(" . join(", ", @M) . ")\n";
}
