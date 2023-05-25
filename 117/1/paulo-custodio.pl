#!/usr/bin/env perl
use v5.36;

my @rows;
while (<DATA>) {
    chomp;
    my($nr, $text) = split /,\s*/, $_;
    $rows[$nr] = $text;
}
say join(",", (map {$_->[0]}
               grep {!defined $_->[1]}
               map {[$_ => $rows[$_]]} 1..15));

__END__
11, Line Eleven
1, Line one
9, Line Nine
13, Line Thirteen
2, Line two
6, Line Six
8, Line Eight
10, Line Ten
7, Line Seven
4, Line Four
14, Line Fourteen
3, Line three
15, Line Fifteen
5, Line Five
