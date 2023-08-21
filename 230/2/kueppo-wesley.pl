#!/usr/bin/env perl
use v5.36;

use Test::More;

sub match($words, $prefix) {
   return scalar grep { /^\Q$prefix\E/ } @$words;
}

is(match(["pay", "attention", "practice", "attend"], "at"), 2, "ok?");
is(match(["janet", "julia", "java", "javascript"], "ja"), 3, "ok?");

done_testing(2);
