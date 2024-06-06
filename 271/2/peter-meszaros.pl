#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;
use Data::Dumper;
use List::Util qw/sum0/;

my $cases = [
	[[0, 1, 2, 3, 4, 5, 6, 7, 8], [0, 1, 2, 4, 8, 3, 5, 6, 7]],
	[[1024, 512, 256, 128, 64],   [64, 128, 256, 512, 1024]],
];

sub sort_by_1_bits
{
    my $l = shift;

    my @v;
    for my $i (0.. $#$l) {
        my $binstr = unpack("B32", pack("N", $l->[$i]));
        $binstr =~ s/^0+(?=[0-9])//;
        $v[$i] = sum0(split(//, $binstr));
    }

    my @l = sort { if ($v[$a] == $v[$b]) {
                    return $l->[$a] <=> $l->[$b]
                   } else {
                    return $v[$a] <=> $v[$b]
                   }} 0 .. $#$l;

    return [$l->@[@l]];
}

for (@$cases) {
    is(sort_by_1_bits($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;

