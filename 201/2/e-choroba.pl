#!/usr/bin/env perl
use v5.36.0;

use Importer ntheory =>
    partitions => { -as => 'penny_piles' };

use Test::More tests => 2;
is penny_piles(5), 7, 'Example 1';
is penny_piles(49), 173525, 'Larger';
