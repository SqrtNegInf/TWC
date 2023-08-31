#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

my $cases = [
    ["7868190130M7522", "5303914400F9211", "9273338290F4010"],
    ["1313579440F2036", "2921522980M5644"],
];

sub senior_citizens
{
    my $citizens = shift;

    my $cnt = 0;
    for my $c (@$citizens) {
        my ($age) = $c =~ m/^\d+[FM](\d{2})\d{2}$/;
        ++$cnt if $age >= 60;
    }

    return $cnt;
}

is(senior_citizens($cases->[0]), 2, '["7868190130M7522", "5303914400F9211", "9273338290F4010"]');
is(senior_citizens($cases->[1]), 0, '["1313579440F2036", "2921522980M5644"]');
done_testing();
