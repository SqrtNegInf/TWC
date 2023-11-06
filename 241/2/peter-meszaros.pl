#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Data::Dumper;

my $cases = [
    [11, 8, 27, 4],
    [110, 3, 14, 6],
];

sub prime_order
{
    my $l = shift;

    my %h;
    for my $n (@$l) {
        $h{$n} = grep { $n % $_ == 0 } 2..$n;
    }
    my @res = sort { if ($h{$a} == $h{$b}) {
                        return $a <=> $b;
                     } else {
                        return $h{$a} <=> $h{$b}
                     }
                   } @$l;
	return \@res;
}

is_deeply(prime_order($cases->[0]), [11, 4, 8, 27],  '[11, 8, 27, 4]');
is_deeply(prime_order($cases->[1]), [3, 6, 14, 110], '[110, 3, 14, 6]');
done_testing();
