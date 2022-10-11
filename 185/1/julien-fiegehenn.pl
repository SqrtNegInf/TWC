#!/usr/bin/env perl
use strict;
use warnings;

sub convert_mac {
    my $mac = shift;

    return $mac =~ s/(..)(..)\.(..)(..)\.(..)(..)/$1:$2:$3:$4:$5:$6/r;
}

use Test::More;

is convert_mac('1ac2.34f0.b1c2'), '1a:c2:34:f0:b1:c2', 'example 1';
is convert_mac('abc1.20f1.345a'), 'ab:c1:20:f1:34:5a', 'example 2';

done_testing;
