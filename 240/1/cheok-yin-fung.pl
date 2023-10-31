#!/usr/bin/env perl
use v5.36;

sub ac {
    my @str = $_[0]->@*;
    my $chk = $_[1];
    return (join "", map { lc substr($_, 0, 1) } @str) eq lc $chk;
}

use Test::More tests=>3;
ok ac(["Perl", "Python", "Pascal"], "ppp");
ok !ac(["Perl", "Raku"], "rp");
ok ac(["Oracle", "Awk", "C"], "oac");
