#!/usr/bin/env perl
use v5.36;

use Test::More;

sub greaterCharacter ($t, @list) { (grep {$_ gt $t} sort @list)[0] // $t }

is(greaterCharacter('b', qw/e m u g/), 'e', 'Example 1');
is(greaterCharacter('a', qw/d c e f/), 'c', 'Example 2');
is(greaterCharacter('o', qw/j a r/),   'r', 'Example 3');
is(greaterCharacter('a', qw/d c a f/), 'c', 'Example 4');
is(greaterCharacter('v', qw/t g a l/), 'v', 'Example 5');

done_testing;
