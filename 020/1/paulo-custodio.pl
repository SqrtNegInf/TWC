#!/usr/bin/env perl

use Modern::Perl;

my $str = 'bookkeeper';

my @segs;
while ($str ne '') {
    $str =~ s/^((.)\2*)//x or die;
    push @segs, $1;
}

say join(", ", map {'"'.$_.'"'} @segs);
