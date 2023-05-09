#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw(next_prime is_prime);

my ($p,$lim,@pal)=(1,shift//1e3);
($p ^ reverse $p) || (push @pal,$p) while ($p=next_prime $p) < $lim;

say for @pal;

$_=1,my$LIM=shift//1e3;
($_^reverse$_)||say while($_=next_prime$_)<$LIM;

