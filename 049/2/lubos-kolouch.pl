#!/usr/bin/env perl

use strict;
use warnings;
use Cache::LRU;

my $size = 3;

my $cache = Cache::LRU->new(
    size => $size
);


use Test::More;

$cache->set(1=>3);
$cache->set(2=>5);
$cache->set(3=>7);

is($cache->get(2),5);
is($cache->get(1),3);
is($cache->get(4),undef);
$cache->set(4=>9);
is($cache->get(3),undef);
done_testing();
