#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;
use Algorithm::Combinatorics qw/permutations/;
use List::Util qw/uniqstr/;

my $cases = [
    'CAT',
    'GOOGLE',
    'SECRET',
];

sub dictionary_rank
{
    my $w = shift;

    my @l = permutations([split(//, $w)]);
    @l = uniqstr sort map {join('', @$_)} @l; 
    for (0..$#l) {
        return $_+1 if $l[$_] eq $w;
    }
    return undef;
}

is(dictionary_rank($cases->[0]),   3, 'Example 1');
is(dictionary_rank($cases->[1]),  88, 'Example 2');
is(dictionary_rank($cases->[2]), 255, 'Example 3');
done_testing();

exit 0;

