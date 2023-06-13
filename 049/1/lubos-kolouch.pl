#!/usr/bin/env perl
use v5.36;

sub find_multiple_0_1 {
    my $input = shift;

    my $count = 0;

    while ($input !~ /^[01]+$/) {
        $input += $input;
        # for some numbers there is probably no result, so let's just return -1
        return -1 if $count == 1000;
        $count++;
    }

    return $input;
}

my $what = 55;

say find_multiple_0_1($what);

use Test::More;

is(find_multiple_0_1(55),110);
done_testing;
