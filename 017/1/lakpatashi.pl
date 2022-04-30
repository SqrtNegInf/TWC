#!/usr/bin/env perl

use warnings;
use strict;
use feature qw(say);

sub A{
	my ($m,$n) = @_;
	if($m == 0){
		return $n+1
	}elsif($n == 0){
		return A($m-1,1);
	}else{
		return A($m-1, A($m, $n-1));
	}
}

say A(0,0);
say A(1,0);
say A(1,1);
say A(1,2);
