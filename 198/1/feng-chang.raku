#!/usr/bin/env perl6

my @N = <2 5 8 1>;

if +@N < 2 { 0.put; exit }

my \max-gap = (^(@N.elems-1)).map({ @N[$_+1] - @N[$_] }).max;
put (^(@N.elems-1)).grep({ max-gap == @N[$_+1] - @N[$_] }).elems;

say '--';

^ (@N.elems - 1)          ==>
map { @N[$_+1] - @N[$_] } ==>
my @gaps; @gaps           ==>
grep { $_ == @gaps.max }  ==>
elems()                   ==>
put();
