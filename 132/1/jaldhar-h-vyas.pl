#!/usr/bin/env perl
use v5.36;
use DateTime;

my $birthday = DateTime->new(year => 1971, month => 3, day => 22);
my $today = DateTime->new(year => 2021, month => 9, day => 22);
my $diff = $today->jd - $birthday->jd;

my $past = $birthday->subtract(days => $diff);
my $future = $today->add(days => $diff);
say $past->ymd(q{/}), q{, }, $future->ymd(q{/});
