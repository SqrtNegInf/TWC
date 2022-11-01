#!/usr/bin/env perl

use v5.36;
use POSIX qw(floor);

my ($counter, $actual)=(0, 0);
my ($x, $y)=my($x0, $y0)=(4,6);
die "Only positive integers allowed" unless $x>0 and $y>0 and $x==floor $x and $y==floor $y;
use integer;
while($y>0){
    my ($d, $r)=($x/$y, $x%$y);
    $counter += $d;
    ++$actual;
    ($x, $y)=($y, $r);
}
say "The number of operations required to bring $x0 $y0 to zero is $counter (divisions: $actual)";
