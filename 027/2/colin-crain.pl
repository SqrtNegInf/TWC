#!/usr/bin/env perl
use v5.36;

use lib '.';        ## park HistoryThing.pm alongside
use HistoryThing;

my $h = HistoryThing->new;

## set some values for x
$h->x(1);
say "x at start: ", $h->x;

$h->x(2);
$h->x(-1);
$h->x('foo');
say "x is currently: ", $h->x;

## set some values for y
$h->y(3);
say "y at start: ", $h->y;

$h->y(4);
$h->y(-5);
$h->y('bar');
say "y is currently: ", $h->y;

say "history of x: ", $h->get_hist('x');
say "history of y: ", $h->get_hist('y');


