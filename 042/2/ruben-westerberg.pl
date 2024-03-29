#!/usr/bin/env perl
use v5.36;

srand 1;

use POSIX qw<round>;

my $maxLength=$ARGV[0]//6; #If no max on command line use 20
for (1..10) {
	my $str="";
	#make a random length string of up to $maxLength long
	$str.=chr round rand()+40 for 0..int rand $maxLength;

	my $v=0;
	for (split "",$str) {
		$v+=(ord($_)-40)*-2+1;
		last unless $v >=0;
	}		

	if($v==0) {
		print("balanced: $str\n");
		sleep 1;
		next;
	}
	print("unbalanced: $str\n");
}


