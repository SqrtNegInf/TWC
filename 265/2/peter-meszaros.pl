#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
    [['aBc 11c', ['accbbb', 'abc', 'abbc']],   'accbbb', 'Example 1'],
    [['Da2 abc', ['abcm', 'baacd', 'abaadc']], 'baacd',  'Example 2'],
    [['JB 007',  ['jj', 'bb', 'bjb']],         'bjb',    'Example 3'],
];

sub completing_word
{
    my $str = $_[0]->[0];
    my $lst = $_[0]->[1];

    my %str;
    $str{lc $_}++ for (grep { /[a-z]/i } split(//, $str));

    my @res;
    NEXTWORD: for my $l (@$lst) {
        my %l;
        $l{$_}++ for (split(//, $l));

        for my $k (keys %str) {
            next NEXTWORD if (not defined $l{$k}) || ($str{$k} > $l{$k});
        }
        push @res, $l;
    }

    return (sort { length($a) <=> length($b) } @res)[0];
}

for (@$cases) {
    is(completing_word($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;

