#!/usr/bin/env perl
use v5.36;
use Test2::V0 -srand => 1;

my @a = qw/1 2 3/;
my @b = qw/a b c/;

is [ zip(\@a, \@b) ], [ qw/1 a 2 b 3 c/ ], 'example 1';
is [ zip(\@b, \@a) ], [ qw/a 1 b 2 c 3/ ], 'Example 2';

done_testing;

sub zip($a, $b) {
    my @list = (@$a, @$b);
    my $size = scalar @$a;

    my @zip = ();
    foreach my $i (0 .. $size-1) {
        push @zip, ($list[$i], $list[$i + $size]);
    }

    return @zip;
}
