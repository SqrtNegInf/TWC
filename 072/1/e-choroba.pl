#!/usr/bin/env perl
use v5.36;

use Math::BigInt;

sub factorial {
    my ($n) = @_;
    my $p = 'Math::BigInt'->new(1);
    $p *= $_ for 1 .. $n;
    $p
}

sub trailing0s {
    my ($n) = @_;
    length((factorial($n) =~ /(0*)$/)[0])
}

sub trailing0s_fast {
    my ($n) = @_;
    my $z = 0;
    my $i = 1;
    $z += int($n / ($i *= 5)) while $i < $n;
    return $z
}

use Test::More;

subtest factorial => sub {
    is factorial(0), 1;
    is factorial(1), 1;
    is factorial(5), 120;
};

subtest trailing0s => sub {
    for my $n (0 .. 15) {
        is trailing0s($n), trailing0s_fast($n), "fast $n";
    }
};

done_testing();
