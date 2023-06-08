#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

sub is_palindrome {
    my ($s) = @_;

    return $s eq reverse $s;
}

sub get_palindromes {
    my ($s) = @_;
    my @palindromes;

    for my $l (2 .. length $s ) {
        my $possible = substr $s, 0, $l;
        if (is_palindrome($possible)) {
            push @palindromes, $possible;
            push @palindromes, get_palindromes(substr $s, $l);
        }
    }

    return @palindromes;
}

my $S = 'aabbababba';
my %results;

for my $n (0 .. (length $S) - 1) {
    for my $palindrome (get_palindromes(substr $S, $n)) {
        $results{$palindrome}++;
    }
}

say scalar keys %results ? join q{, }, sort keys %results : '-1';
