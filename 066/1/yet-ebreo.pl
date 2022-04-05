#!/usr/bin/env perl

($m,$n)=(11,3);
($x,$y)=(~~$m,~~$n);
$r=()=(1x$m)=~/1{$y}/g;
$y&&print$m<0^$n<0?-$r:$r;
