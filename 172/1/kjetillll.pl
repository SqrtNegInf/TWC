#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util 'forpart', 'is_prime';
use List::Util 'any', 'uniq';

my($m, $n) = (38, 2);
say "@$_" for pp($m, $n);

sub pp {
    my($m, $n)=@_;
    my @pp;
    forpart { any {not is_prime($_)} @_ or @_==&uniq and push @pp,\@_ } $m, {n=>$n};
    @pp;
}
