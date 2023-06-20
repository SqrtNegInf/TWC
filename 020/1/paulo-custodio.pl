#!/usr/bin/env perl
use v5.36;

my $str = 'bookkeeper';

my @segs;
while ($str ne '') {
    $str =~ s/^((.)\2*)//x or die;
    push @segs, $1;
}

say join(", ", map {'"'.$_.'"'} @segs);
