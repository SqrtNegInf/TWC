#!/usr/bin/env perl
use v5.36;

sub next_palindrome_number_slow {
    my ($n) = @_;
    1 until ++$n eq reverse $n;
    return $n
}

sub next_palindrome_number {
    my ($n) = @_;
    my $p = $n + 1;
    my $l = length $p;
    my $l2 = int($l / 2);
    substr $p, -$_, 1, substr $p, $_ - 1, 1 for 1 .. $l2;
    return $p if $p > $n;

    substr $p, $l2 + $l % 2, $l2, "";
    ++$p;
    $p .= '0' x $l2;
    substr $p, -$_, 1, substr $p, $_ - 1, 1 for 1 .. $l2;
    return $p
}

use Test::More;

is next_palindrome_number(1234), 1331, 'Example 1';
is next_palindrome_number(999),  1001, 'Example 2';

done_testing();
