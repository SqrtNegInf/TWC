#!/usr/bin/env perl
use v5.36;
use POSIX qw(ceil floor);
N:
    for my $n(7,8,9) {
	for my $b(2..$n-2){
	    my $m=ceil(log($n)/log($b));
	    my $d=floor($n*($b-1)/($b**$m-1));
	    say("$n=", (($d)x$m)," in base $b is Brazilian"), next N
		if $d*($b**$m-1)/($b-1)==$n
	}
	say "$n is not Brazilian"
}
