#!/usr/bin/env perl
use v5.36;

use Scalar::Util qw/looks_like_number/; # distributed with perl since 5.8

sub remove_leading_zeros {
    my $num = shift;
    # ask perl if it thinks input is a number, and make sure it's positive
    if (looks_like_number($num) && $num > 0) {
        $num =~ s/^
            (
             0*      # match all leading 0s followed by
             (?=0\.) # 0. (not included in match)
             |
             0*      # or just all leading 0s
            )
        //x;
    }
    $num;
}

if (@ARGV) {
    say remove_leading_zeros shift;
}
else {
    eval "use Test::More";
    is(remove_leading_zeros("000000"),    "000000");
    is(remove_leading_zeros("-0001"),     "-0001");
    is(remove_leading_zeros("0001"),      "1");
    is(remove_leading_zeros("0.001"),     "0.001");
    is(remove_leading_zeros(".001"),      ".001");
    is(remove_leading_zeros("000.001"),   "0.001");
    is(remove_leading_zeros("001bar"),    "001bar");
    is(remove_leading_zeros("fizzbuzz"),  "fizzbuzz");
    done_testing();
}
