#!/usr/bin/env perl
use v5.36;


sub multiply {
    my $input = shift;

    my $first = $input->{first};
    my $second = $input->{second};

    my $result = 0;

    while ($first > 1) {
        $first = int($first / 2);
        $second *= 2;

        $result += $second;
    }

    return $result;
}
use Test::More;

is(multiply({first => 14, second => 12}), 168);

done_testing;
