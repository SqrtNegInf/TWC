#!/usr/bin/env perl
use v5.36;

use Memoize;

memoize('F');
sub F($n) {
    return 1 if $n == 0;
    return $n - M( F($n-1) );
}

memoize('M');
sub M($n) {
    return 0 if $n == 0;
    return $n - F( M($n-1) );
}

my $len = 20;

my @f = map { F($_) } (0..($len-1));
my @m = map { M($_) } (0..($len-1));

say "F: " . join(" ", @f);
say "M: " . join(" ", @m);

