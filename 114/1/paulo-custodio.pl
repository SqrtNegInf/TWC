#!/usr/bin/env perl
use v5.36;

my $N = shift || 1234;
say next_palindrome($N);

sub is_palindrome {
    my($n) = @_;
    return reverse($n)==$n;
}

sub next_palindrome {
    my($n) = @_;
    while (1) {
        $n++;
        return $n if is_palindrome($n);
    }
}
