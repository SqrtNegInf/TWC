#!/usr/bin/env perl
use v5.36;

for (my $i = 0; $i <= 50; $i++) {

	print "Decimal $i = Octal "; 
	printf("%o\n",$_)for "$i";
}
